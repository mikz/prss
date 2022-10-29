module PRSS
  autoload :CLI, 'prss/cli'
  autoload :Downloader, 'prss/downloader'
  autoload :Feed, 'prss/feed'
  autoload :Links, 'prss/links'
  autoload :VERSION, 'prss/version'
  autoload :Watcher, 'prss/watcher'


  def self.load!
    constants(false).each(&method(:const_get))
  end
end
