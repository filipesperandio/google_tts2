require 'google_tts/connector'
require 'google_tts/query_builder'
require 'google_tts/parser'
require 'google_tts/mp3writer'

module GoogleTts
  VERSION = "0.1.0"

  class Client
    include GoogleTts

    def initialize(connector = Connector.new,
                   query_builder = QueryBuilder.new,
                   mp3writer = Mp3Writer.new,
                   parser = Parser.new)
      @connector = connector
      @parser = parser
      @query_builder = query_builder
      @mp3writer = mp3writer
    end

    def save(name, text)
      sentences = @parser.sentences(text)
      queries = @query_builder.generate_from(*sentences)
      contents = @connector.get_contents(*queries)
      @mp3writer.save(name, *contents)
    end

  end

  def self.instantiate(params = {})
    proxy = params[:proxy] || @proxy
    connection = proxy ? Net::HTTP::Proxy(proxy[:host], proxy[:port]) : Net::HTTP
    lang = params[:lang] || :en
    output = params[:output] || "out"
    Client.new(Connector.new(connection), QueryBuilder.new(lang), Mp3Writer.new(output))
  end

  def self.with_random_proxy(_params = {})
    @proxy = ProxyFetcher.random_proxy
    self
  end

end
