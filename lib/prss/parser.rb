require 'nokogiri'

module PRSS
  class Parser
    def initialize(xml)
      @xml = xml
    end

    def channel
      @channel ||= Nokogiri::XML.parse(@xml).xpath('//channel')
    end

    def links
      channel.xpath('//item/link')
    end

    def each(&block)
      links.each do |link|
        yield link.content
      end
    end

  end
end
