require 'rubygems'
require 'rake'
require './lib/wsoc/version.rb'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = 'wsoc'
    gem.version = WSOC::VERSION
    gem.license = 'GPL-2'
    gem.summary = %Q{An example web server that tests the thoroughness and resilience of Web Spiders}
    gem.description = %Q{The Web Spider Obstacle Course (WSOC) is an example web server that tests the thoroughness and resilience of Web Spiders.}
    gem.email = 'postmodern.mod3@gmail.com'
    gem.homepage = 'http://github.com/postmodern/wsoc'
    gem.authors = ['Postmodern']
    gem.add_dependency 'json', '>= 1.2.0'
    gem.add_dependency 'sinatra', '>= 0.9.4'
    gem.add_development_dependency 'yard', '>= 0.5.3'
    gem.has_rdoc = 'yard'
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

begin
  require 'yard'

  YARD::Rake::YardocTask.new
rescue LoadError
  task :yard do
    abort "YARD is not available. In order to run yard, you must: gem install yard"
  end
end
