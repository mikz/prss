require 'nokogiri'

module PRSS
  class Links
    def initialize(xml)
      @xml = xml
    end

    def channel
      @channel ||= Nokogiri::XML.parse(@xml).xpath('//channel')
    end

    def links
      channel.xpath('//item/link').tap do |links|
        puts "Found #{links.size} links"
      end
    end

    def each(&block)
      links.each do |link|
        yield link.content
      end
    end

  end
end
