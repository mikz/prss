require 'typhoeus'

module PRSS
  class Fetcher
    PERSONAL_FEED_URL = "https://hdbits.org/rss/my"

    attr_reader :uri

    def initialize(passkey)
      #@passkey = passkey
      @uri = URI(PERSONAL_FEED_URL)
      @uri.query = "passkey=#{passkey}"
    end

    def response
      @response ||= Typhoeus::Request.get(@uri.to_s)
    end

    def output
      response.body
    end

  end
end
