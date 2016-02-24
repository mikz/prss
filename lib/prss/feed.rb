require 'net/http'
require 'uri'
require 'benchmark'

module PRSS
  class Feed
    PERSONAL_FEED_URL = ENV.fetch('PRSS_FEED_URL') { 'https://hdbits.org/rss/my'.freeze }

    attr_reader :uri

    def initialize(passkey)
      #@passkey = passkey
      @uri = URI(PERSONAL_FEED_URL)
      @uri.query = "passkey=#{passkey}"
      @uri.freeze
    end

    def response
      response = nil
      time = Benchmark.realtime do
        response = Net::HTTP.get(@uri)
      end

      puts "Fetched #{@uri} in #{time.round(2)}s"
      response
    end

    def output
      response
    end

    def links
      Links.new(output)
    end

    def download_to(output)
      downloader.download_to(output)
    end

    def downloader
      Downloader.new(links)
    end
  end
end
