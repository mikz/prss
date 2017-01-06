module PRSS
  class Watcher
    def initialize(feed)
      @feed = feed
    end

    def start(interval, output)
      loop = Thread.new do
        loop do
          begin
            @feed.download_to(output)
          rescue PRSS::Links::InvalidXMLError
            warn 'ignoring invalid xml'
          end

          sleep(interval)
        end
      end

      Kernel.trap( "INT" ) { loop.exit }

      loop.join
    end
  end
end
