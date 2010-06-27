require 'rubygems'
require 'bundler'

begin
  Bundler.setup(:development, :doc)
rescue Bundler::BundlerError => e
  STDERR.puts e.message
  STDERR.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

require 'rake'
require 'jeweler'
require './lib/wsoc/version.rb'

Jeweler::Tasks.new do |gem|
  gem.name = 'wsoc'
  gem.version = WSOC::VERSION
  gem.license = 'GPL-2'
  gem.summary = %Q{An example web server that tests the thoroughness and resilience of Web Spiders}
  gem.description = %Q{The Web Spider Obstacle Course (WSOC) is an example web server that tests the thoroughness and resilience of Web Spiders.}
  gem.email = 'postmodern.mod3@gmail.com'
  gem.homepage = 'http://github.com/postmodern/wsoc'
  gem.authors = ['Postmodern']
  gem.has_rdoc = 'yard'
end

require 'yard'
YARD::Rake::YardocTask.new
