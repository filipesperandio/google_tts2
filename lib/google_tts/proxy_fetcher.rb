require 'nokogiri'
require 'open-uri'

module GoogleTts

  class ProxyFetcher
    @@SOURCES = [
      "http://www.freeproxylists.com/rss", 
      "http://www.proxz.com/proxylists.xml"
    ]

    def self.list
    end

    def self.random_proxy
      @@list.sample
    end

    @@list = list

  end

end
