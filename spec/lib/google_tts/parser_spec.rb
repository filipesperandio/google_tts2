# encoding: UTF-8

require 'spec_helper'

describe GoogleTts::Parser do
  before(:all) do
    @txt = File.open("spec/fixtures/big_text.txt").read
  end

  it "respsect this interface" do
    expect(subject).to respond_to(:sentences)
  end

  it 'should split sentences by dots' do
    result = subject.paragraphs "Ola! Tudo bem? - Tudo bem."
    expect(result.size).to eq(3)
    expect(result[0]).to include('!')
    expect(result[1]).to include('?')
    expect(result[2]).to include('.')
  end

  it 'should split a big sentence' do
    chop_size_by_tokenizer = subject.paragraphs(@txt).size
    result = subject.sentences @txt
    expect(result.size).to be > chop_size_by_tokenizer
  end

  it 'should split sentences no bigger than 100 chars each' do
    result = subject.sentences @txt
    result.each do |r|
      p r if r.length > 100
      expect(r.length ).to be <= 100
    end
  end

  it 'should split big sentence in commas os minor pieces' do
    text = "O projeto é de autoria do arquiteto João Batista Giovenale, então professor da Academia de Belas Artes - São Lucas - de Roma, e membro da Comissão de Arte Sacra da Basílica de São Pedro."
    result = subject.sentences text
    expect(result.length).to be > text.count(',')
  end

end

