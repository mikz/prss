require 'net/http'
require 'pathname'

module PRSS
  class Downloader

    def initialize(links)
      @links = links
    end

    def self.verify!(output_path)
      output = Pathname.new(output_path).expand_path
      raise 'output path is not directory' unless output.directory?
      output
    end

    def download_to(output_path)
      output = self.class.verify!(output_path)

      @files = @links.each.map do |uri|
        response = Net::HTTP.get_response(uri)
        save_file(response, output)
      end.compact
    end

    def save_file(response, output)
      filename = response['Content-Disposition'][/filename="(.+)"$/ ,1]
      file = output.join(filename)

      return if file.exist?

      open(file, 'wb') do |file|
        body = response.body
        file.write(body)
      end

      filename
    end

  end
end
