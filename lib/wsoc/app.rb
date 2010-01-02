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

require 'wsoc/course'
require 'wsoc/course_specs'
require 'wsoc/helpers'
require 'wsoc/version'

require 'rubygems'
require 'sinatra'
require 'nokogiri'

module WSOC
  class App < Sinatra::Base

    include Course

    set :host, Config::DEFAULT_HOST
    set :port, Config::DEFAULT_PORT

    set :root, File.expand_path(File.join(File.dirname(__FILE__),'..','..'))
    set :course, File.join(self.public,'course')
    enable :static, :sessions

    helpers WSOC::Helpers

    get '/' do
      show :welcome
    end

    get '/specs' do
      @specs = specs

      show :specs
    end

    get Config::SPECS_PATHS[:json] do
      json specs
    end

    get Config::SPECS_PATHS[:yaml] do
      yaml specs
    end

    course_template '/course/start.html'

    get '/course/fail' do
      status 404
      show :course_fail
    end

    course_template '/course/relative/start.html'
    course_template '/course/relative/same_directory.html'
    course_template '/course/relative/current_directory.html'
    course_template '/course/relative/normal.html'

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

    course_template '/course/redirect/start.html'

    get '/course/redirect/300.html' do
      redirect remote_url('/course/redirect/300/pass.html')
    end

    get '/course/redirect/301.html' do
      redirect remote_url('/course/redirect/301/pass.html')
    end

    get '/course/redirect/302.html' do
      redirect remote_url('/course/redirect/302/pass.html')
    end

    get '/course/redirect/303.html' do
      redirect remote_url('/course/redirect/303/pass.html')
    end

    get '/course/redirect/307.html' do
      redirect remote_url('/course/redirect/307/pass.html')
    end

    get '/course/cookies/start.html' do
      response.set_cookie 'auth_level', '1'

      course_page :course_cookies_start
    end

    get '/course/cookies/get.html' do
      @authed = (request.cookies['auth_level'] == '1')

      course_page :course_cookies_get
    end

    get '/course/cookies/post.html' do
      response.set_cookie 'auth_level', '2'

      course_page :course_cookies_post
    end

    post '/course/cookies/post.html' do
      @authed = (request.cookies['auth_level'] == '2')

      course_page :course_cookies_post
    end

    course_template '/course/cookies/protected/1.html'
    course_template '/course/cookies/protected/2.html'

    get '/*' do
      redirect remote_url('/course/fail')
    end

  end
end
