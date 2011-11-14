require 'typhoeus'
require 'pathname'

module PRSS
  class Downloader
    def initialize(links)
      @links = links
      @hydra = Typhoeus::Hydra.new
    end

    def download_to(output_path)
      output = Pathname.new(output_path).expand_path
      raise 'output path is not directory' unless output.directory?

      @files = []
      @links.each do |link|
        request = Typhoeus::Request.new(link, :follow_location => true)

        request.on_complete do |response|
          @files << save_file(response, output)
        end

        @hydra.queue request
      end

      @hydra.run

      @files
    end

    def save_file response, output
      filename = response.headers_hash['Content-Disposition'][/filename="(.+)"$/ ,1]
      file = output.join(filename)

      open(file, 'wb') do |file|
        file.write(response.body)
      end

      file
    end

  end
end
