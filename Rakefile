# -*- ruby -*-

require 'rubygems'
require 'hoe'
require 'hoe/signing'
require './tasks/yard.rb'

Hoe.spec('wsoc') do
  self.developer('Postmodern', 'postmodern.mod3@gmail.com')

  self.readme_file = 'README.rdoc'
  self.history_file = 'History.rdoc'
  self.remote_rdoc_dir = '/'

  self.extra_deps += [
    ['json', '>=1.2.0'],
    ['sinatra', '>=0.9.4']
  ]

  self.extra_dev_deps += [
    ['yard', '>=0.5.2']
  ]

  self.spec_extras.merge!(:has_rdoc => 'yard')
end

# vim: syntax=ruby
