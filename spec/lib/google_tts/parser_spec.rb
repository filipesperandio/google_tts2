# encoding: UTF-8

require 'spec_helper'

describe GoogleTts::Parser do
  before(:all) do
    @txt = File.open("spec/fixtures/big_text.txt").read
  end

  it "respsect this interface" do
    expect(subject).to respond_to(:chop)
  end

  it 'should split sentences by dots' do
    result = subject.chop "Ola. Tudo bem? Tudo bem."
    expect(result.size).to eq(3)
  end

  it 'should split a big sentence' do
    chop_size_by_tokenizer = 45
    result = subject.chop @txt
    expect(result.size).to be > chop_size_by_tokenizer
  end

  it 'should split sentences no bigger than 100 chars each' do
    result = subject.chop @txt
    result.each do |r|
      p r if r.length > 100
      expect(r.length ).to be <= 100
    end
  end

  it 'should split on commas' do
    result = subject.chop "O projeto é de autoria do arquiteto João Batista Giovenale, então professor da Academia de Belas Artes - São Lucas - de Roma, e membro da Comissão de Arte Sacra da Basílica de São Pedro."
    expect(result.length).to be > 1
  end

end

