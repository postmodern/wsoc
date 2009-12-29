#
# WSOC - The Web Spider Obstacle Course
#
# Copyright (c) 2009 Hal Brodigan (postmodern.mod3 at gmail.com)
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
#

require 'wsoc/specs'
require 'wsoc/course_parser'
require 'wsoc/helpers'
require 'wsoc/version'

require 'rubygems'
require 'sinatra'
require 'nokogiri'

module WSOC
  class App < Sinatra::Base

    extend CourseParser

    set :root, File.expand_path(File.join(File.dirname(__FILE__),'..','..'))
    set :course, File.join(self.public,'course')
    enable :static, :sessions

    helpers WSOC::Helpers

    get '/' do
      show :welcome
    end

    get '/specs.json' do
      json Specs.map(self.host,self.port)
    end

  end
end
