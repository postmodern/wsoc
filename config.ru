#!/usr/bin/env ruby
$LOAD_PATH.unshift ::File.expand_path(::File.join(::File.dirname(__FILE__),'lib'))

require 'rubygems'
require 'wsoc/app'

WSOC::App.set :environment, (ENV['RACK_ENV'] || :production)

run WSOC::App
