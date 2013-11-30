require 'google_tts/connector'
require 'google_tts/query_builder'
require 'google_tts/parser'
require 'google_tts/mp3writer'

module GoogleTts
  VERSION = "0.0.2"

  class Client
    include GoogleTts

    def initialize(connector = Connector.new, parser = Parser.new,
      query_builder = QueryBuilder.new, mp3writer = Mp3Writer.new)
      @connector = connector
      @parser = parser
      @query_builder = query_builder
      @mp3writer = mp3writer
    end

    def save(name, text)
      sentences = @parser.sentences text
      queries = @query_builder.generate_from *sentences
      contents = @connector.get_contents *queries

      @mp3writer.save name, *contents
    end

  end
end
