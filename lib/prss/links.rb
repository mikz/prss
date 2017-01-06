require 'rexml/document'
require 'uri'

module PRSS
  class Links
    class InvalidXMLError < StandardError; end

    def initialize(xml)
      @xml = ::REXML::Document.new(xml)
    rescue REXML::ParseException
      raise InvalidXMLError
    end

    attr_reader :xml

    def links
      xml.elements.to_a('//item/link').tap do |links|
        puts "Found #{links.size} links"
      end
    end

    def each
      return to_enum unless block_given?

      links.each do |link|
        yield URI(link.text.strip)
      end
    end

  end
end
