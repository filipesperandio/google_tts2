module GoogleTts

  class Mp3Writer

    def initialize(dir)
      FileUtils.mkdir_p dir
      @dir = dir
    end

    def save(file_name, content)
      file_path = "#{@dir}/#{file_name}.mp3"
      File.open(file_path, "wb") do |f|
        f.write content
      end
      file_path
    end

  end

end

