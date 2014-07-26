require 'typhoeus'
require 'uri'

module PRSS
  class Feed
    PERSONAL_FEED_URL = "https://hdbits.org/rss/my"

    attr_reader :uri

    def initialize(passkey)
      #@passkey = passkey
      @uri = URI(PERSONAL_FEED_URL)
      @uri.query = "passkey=#{passkey}"
    end

    def response
      Typhoeus::Request.get(@uri.to_s).tap do |response|
        puts "Fetched #{@uri} in #{response.total_time}s"
      end
    end

    def output
      response.body
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
