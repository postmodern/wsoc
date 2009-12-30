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

require 'wsoc/course_specs'
require 'wsoc/helpers'
require 'wsoc/version'

require 'rubygems'
require 'sinatra'
require 'nokogiri'

module WSOC
  class App < Sinatra::Base

    set :root, File.expand_path(File.join(File.dirname(__FILE__),'..','..'))
    set :course, File.join(self.public,'course')
    enable :static, :sessions

    helpers WSOC::Helpers

    def self.course_template(path)
      name = path[1..-1].gsub(/\.\S*$/,'').gsub(/\/+/,'_').to_sym

      get(path) do
        erb name, :layout => false
      end
    end

    get '/' do
      show :welcome
    end

    get '/specs.json' do
      json CourseSpecs.specs_for(request.host,request.port)
    end

    get '/specs.yaml' do
      yaml CourseSpecs.specs_for(request.host,request.port)
    end

    course_template '/course/start.html'
    course_template '/course/absolute/start.html'
    course_template '/course/absolute/next.html'

    course_template '/course/empty/start.html'

    course_template '/course/frames/start.html'
    course_template '/course/frames/frame.html'
    course_template '/course/frames/frame_contents.html'
    course_template '/course/frames/iframe.html'
    course_template '/course/frames/iframe_contents.html'

    course_template '/course/javascript/start.html'

    course_template '/course/loop/start.html'
    course_template '/course/loop/next.html'

    course_template '/course/remote/start.html'
    course_template '/course/remote/next.html'

    get '/course/*' do
      @url = request.url

      status 404
      show :course_fail
    end

  end
end
