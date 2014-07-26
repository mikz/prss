module PRSS
  class Watcher
    def initialize(feed)
      @feed = feed
    end

    def start(interval, output)
      loop = Thread.new do
        loop do
          @feed.download_to(output)
          sleep(interval)
        end
      end

      Kernel.trap( "INT" ) { loop.exit }

      loop.join
    end
  end
end
