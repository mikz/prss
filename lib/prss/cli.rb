require 'pathname'

module PRSS
  class CLI
    def initialize passkey, output_dir
      @passkey = passkey
      @output_dir = Pathname.new(output_dir)
      raise 'no passkey' unless passkey
      raise 'no output dir' unless output_dir
    end

    def run!
      output = Fetcher.new(@passkey).output
      links = Parser.new(output)
      downloaded = Downloader.new(links).download_to(@output_dir)
    end
  end
end
