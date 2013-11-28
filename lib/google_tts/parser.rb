require "tactful_tokenizer"
require "uri"

module GoogleTts
  MAX_LENGTH = 100
  SPACE = URI.escape(" ")

  class Parser

    def initialize 
      @tokenizer = TactfulTokenizer::Model.new
    end

    def paragraphs(text = "")
      @tokenizer.tokenize_text text
    end

    def sentences(text = "")
      tokens = paragraphs text
      tokens.flat_map do |token| 
        token = URI.escape(token)
        next_partial(token) {
          token.scan(/[^,]*[,]/).flat_map do |subtoken|
            next_partial(subtoken) { 
              accumulate(subtoken)
            }
          end
        }
      end
    end

    private 

    def bad_size?(text)
      text.length >= MAX_LENGTH
    end

    def next_partial(txt, &partials)
      bad_size?(txt) ? partials.call : txt
    end

    def accumulate(sentence)
      partial = []
      tmp = ''
      sentence.split(SPACE).each do |a|
        if bad_size? "#{tmp}#{a}" 
          partial << custom_strip(tmp)
          tmp = '' 
        end
        tmp += "#{a}#{SPACE}"
      end
      partial << custom_strip(tmp)
      partial
    end

    def custom_strip(txt)
      txt.gsub(/^*#{SPACE}$/, '')
    end

  end

end
