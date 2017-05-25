require 'nokogiri'
require 'open-uri'

module GoogleTts

  class ProxyFetcher
    @@SOURCES = [
      "http://www.freeproxylists.com/rss", 
      "http://www.proxz.com/proxylists.xml"
    ]

    def self.list
      list = []
      @@SOURCES.each do |url|
        Nokogiri::XML(open url).xpath("//prx:proxy").each do |node|
          proxy = { host: node.xpath("prx:ip").text, 
                    port: node.xpath("prx:port").text,
                    type: node.xpath("prx:type").text,
                    ssl: node.xpath("prx:ssl").text.downcase == "true" }
          list << proxy if (proxy[:type] == "Anonymous" and not proxy[:ssl])
        end
      end
      list
    end

    def self.random_proxy
      @@list.sample
    end

    @@list = list

  end

end
