require 'thor'

module PRSS
  class CLI < Thor


    desc 'watch PASSKEY OUTPUT', 'run in loop in given interval'
    method_option :interval, type: :numeric, default: 30, aliases: %w[-i]
    def watch(passkey, output)
      Downloader.verify!(output)
      feed = Feed.new(passkey)
      watcher = Watcher.new(feed)
      watcher.start(options[:interval], output)
    end

    desc 'download PASSKEY OUTPUT', 'fetch feed once and quit'
    def download(passkey, output)
      Downloader.verify!(output)

      feed = Feed.new(passkey)
      downloaded = feed.download_to(output_dir)

      puts "Downloaded #{downloaded.count} files to #{output_dir}."
      puts "Files:", *downloaded unless downloaded.empty?
    end
  end
end
