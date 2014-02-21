# encoding: UTF-8
require 'spec_helper'

describe GoogleTts do

  describe 'integration test' do 
    context GoogleTts::Client do
      DIR = "out"

      it 'save a mp3' do
        subject = GoogleTts.instantiate({ :output => DIR, :lang => :pt })
        subject.save "file1", "Olá, tudo bem com você?"
        expect(File.exists?("out/file1.mp3")).to be_true
      end

      it 'uses proxy' do
        subject = GoogleTts.with_random_proxy.instantiate({ :output => DIR, :lang => :pt })
        subject.save "file2", "Olá, tudo bem com você?"
        expect(File.exists?("out/file2.mp3")).to be_true
      end

      after(:each) do
        FileUtils.rm_r "out"
      end

    end
  end


  context '#instantiate' do

    it 'should fall back to defaults' do
      expect(GoogleTts.instantiate).to_not be_nil
    end

  end

end
