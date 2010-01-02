#
# WSOC - The Web Spider Obstacle Course
#
# Copyright (c) 2009-2010 Hal Brodigan (postmodern.mod3 at gmail.com)
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

require 'wsoc/config'

module WSOC
  module Course
    def self.included(base)
      base.module_eval do
        set :host, Config::DEFAULT_HOST
        set :port, Config::DEFAULT_PORT

        set :root, File.expand_path(File.join(File.dirname(__FILE__),'..','..'))
        set :course, File.join(self.public,'course')
        enable :static, :sessions

        helpers WSOC::Helpers

        #
        # Adds a path to the Obstacle Course, where a course template
        # will be rendered.
        #
        # @param [String] path
        #   The path to add to the obstacle course.
        #
        # @since 0.1.0
        #
        def self.course_template(path)
          name = path[1..-1].gsub(/\.\S*$/,'').gsub(/\/+/,'_').to_sym

          get(path) do
            erb name, :layout => false
          end
        end

        #
        # Adds a path to the Obstacle Course.
        #
        # @param [String] path
        #   The path to add to the obstacle course.
        #
        # @since 0.1.0
        #
        def self.course_pass(path)
          get(path) do
            erb :course_pass, :layout => false
          end
        end
      end
    end
  end
end
