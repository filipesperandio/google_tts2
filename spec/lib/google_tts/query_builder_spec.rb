# encoding: UTF-8
require 'spec_helper'
require 'uri'

describe GoogleTts::QueryBuilder do

  subject do
    GoogleTts::QueryBuilder.new :pt
  end

  it 'builds a query o sentence' do
    sentence = URI.escape "uma pequena frase" 
    query = subject.generate_from sentence

    expect(query).to include("/translate_tts?ie=UTF-8&tl=#{:pt.to_s}&q=#{sentence}&textlen=#{sentence.length}&idx=0&total=1")
  end

end

