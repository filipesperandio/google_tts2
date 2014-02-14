# encoding: UTF-8
require 'spec_helper'
require 'uri'

describe GoogleTts::ProxyFetcher do

  it 'get proxy sample' do
    proxy = GoogleTts::ProxyFetcher.random_proxy
    expect(proxy).to include(:host, :port)
    expect(proxy[:ssl]).to be(false)
  end

end


