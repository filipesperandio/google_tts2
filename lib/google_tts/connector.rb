require 'net/http'

module GoogleTts

  class Connector

    def initialize(http_connection = Net::HTTP)
      @connection = http_connection
    end

    def get(*paths)
      begin
        http = @connection.start('translate.google.com') 

        result = paths.map do |path|
          response = http.get path
          raise Error if response.code != "200"
          response.body
        end

        result

      ensure
        http.finish
      end

    end

  end

end
