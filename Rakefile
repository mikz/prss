#!/usr/bin/env rake
require "bundler/gem_tasks"


task default: :test

task :test do
  Bundler.setup
  require 'prss'

  PRSS.load!
end
