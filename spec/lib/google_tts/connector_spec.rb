# encoding: UTF-8
require 'spec_helper'

describe GoogleTts::Connector do
  let(:connection) { double(Net::HTTP) }
  let(:http) { double(Net::HTTP) }
  let(:response) { double(Net::HTTPResponse) }

  subject do
    GoogleTts::Connector.new connection 
  end

  before do
    connection.should_receive(:start).with("translate.google.com").and_return(http)
    http.should_receive(:finish)
    allow(response).to receive(:body).and_return(Object.new)
    allow(response).to receive(:code).and_return("200")
  end

  context '#get' do

    it 'should connect to google translate' do
      http.should_receive(:get).exactly(2).times.and_return(response)
      subject.get '/123', '/abc'
    end

    it 'should return an array of response bodies' do
      http.should_receive(:get).exactly(3).times.and_return(response)
      result = subject.get '/123', '/abc', '/xyz'
      expect(result).to eq([ response.body, response.body, response.body ])
    end

    it 'fails on a bad response' do
      response.should_receive(:code).and_return("400")
      http.should_receive(:get).and_return(response)
      expect {
        subject.get '/123'
      }.to raise_error
    end

    it 'fails on a bad connection' do
      http.should_receive(:get).and_raise("exception")
      expect {
        subject.get '/123'
      }.to raise_error
    end

  end

end

