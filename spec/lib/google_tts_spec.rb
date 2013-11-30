# encoding: UTF-8
require 'spec_helper'

describe GoogleTts::Client do

  it 'save a mp3' do
    subject.save "file1", "Olá, tudo bem com você?"
    expect(File.exists?("tmp/mp3/file1.mp3")).to be_true
  end

  after do
    FileUtils.rm_r "tmp/mp3"
  end

end

