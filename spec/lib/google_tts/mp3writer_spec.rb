# encoding: UTF-8
require 'spec_helper'

describe GoogleTts::Mp3Writer do
  MP3_DIR = "tmp/mp3"

  subject do 
    GoogleTts::Mp3Writer.new MP3_DIR
  end

  after do
    FileUtils.rm_r MP3_DIR
  end

  it 'should create dir and save' do
    subject.save 'name','content' 
    expect(File.exists?("#{MP3_DIR}/name.mp3")).to be_true
  end

  it 'should return file path' do
    file_path = subject.save 'name2', 'content'
    expect(file_path).to eq("#{MP3_DIR}/name2.mp3")
  end

  it 'create file with the matching returned file path' do
    path = subject.save 'name','content' 
    expect(File.exists?(path)).to be_true
  end


end
