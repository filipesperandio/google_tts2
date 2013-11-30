# encoding: UTF-8
require 'spec_helper'

describe GoogleTts do

  context GoogleTts::Client do
    DIR = "out"

    subject do
      GoogleTts.instantiate({ :output => DIR, :lang => :pt })
    end

    it 'save a mp3' do
      subject.save "file1", "Olá, tudo bem com você?"
      expect(File.exists?("out/file1.mp3")).to be_true
    end

    after do
      FileUtils.rm_r "out"
    end

  end


  context '#instantiate' do

    it 'should fall back to defaults' do
      expect(GoogleTts.instantiate).to_not be_nil
    end

  end

end
