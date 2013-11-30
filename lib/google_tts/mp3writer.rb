module GoogleTts

  class Mp3Writer

    def initialize(dir = "tmp/mp3")
      FileUtils.mkdir_p dir
      @dir = dir
    end

    def save(file_name, *contents)
      file_path = "#{@dir}/#{file_name}.mp3"
      File.open(file_path, "wb") do |f|
        contents.each do |content|
          f.write content
        end
      end
      file_path
    end

  end

end

