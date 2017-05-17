require "uri"

module GoogleTts

  class Parser
    MAX_LENGTH = 100
    SPACE = URI.escape(" ")

    def paragraphs(text = "")
      paragraphs = text.split(/(?<=[\.\?\!])/)
      paragraphs.map do |p|
        p.strip
      end
    end

    def sentences(text = "")
      text = URI.escape(text)
      return [text] if text.length < MAX_LENGTH

      tokens = paragraphs(remove_extra_spaces(text))
      tokens.flat_map do |token| 
        next_partial(token) {
          comma_setences = token.split(',').flat_map do |subtoken|
            subtoken = remove_extra_spaces("#{subtoken},")
            next_partial(subtoken) { accumulate(subtoken, SPACE) }
          end
          comma_setences[-1] = custom_strip(comma_setences.last, ',')
          comma_setences
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

    def splitInHalf(sentence, separator)
      firstHalf = sentence[0..(sentence.length/2)]
      firstHalf = firstHalf[0..(firstHalf.rindex(separator)-1)]
      secondHalf = sentence[(firstHalf.length)..-1]
      [firstHalf, secondHalf]
    end

    def accumulate(sentence, separator, &next_step)
      splitInTwo = splitInHalf(sentence, separator)
      return splitInTwo if splitInTwo[0].length <= 100 and splitInTwo[1].length <= 100

      partial = []
      tmp = ''
      sentence.split(separator).each do |a|
        if bad_size? "#{tmp}#{a}" 
          partial << custom_strip(tmp)
          tmp = '' 
        end
        tmp += "#{a}#{separator}"
      end
      partial << custom_strip(tmp)
      partial
    end

    def custom_strip(txt, strip_out = SPACE)
      txt.gsub(/^*#{strip_out}$/, '').strip
    end

    def remove_extra_spaces(txt)
      txt.gsub(/[ ]+/, " ")
    end

  end

end
