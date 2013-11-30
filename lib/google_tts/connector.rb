require 'net/http'

module GoogleTts

  class Connector

    def initialize(http_connection = Net::HTTP)
      @connection = http_connection
    end

    def get_contents(*paths)
      begin
        http = @connection.start('translate.google.com') 

        result = paths.map do |path|
          response = http.get path
          raise_error(response) if response.code != "200"
          response.body
        end

        result

      ensure
        http.finish
      end

    end

    def raise_error(response)
      raise "Error: response code #{response.code}" 
    end

  end

end
