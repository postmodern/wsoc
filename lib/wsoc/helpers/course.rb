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
require 'wsoc/course_specs'

module WSOC
  module Helpers
    module Course
      #
      # Renders a course page.
      #
      # @param [Symbol] name
      #   The name of the course page.
      #
      # @return [String]
      #   The rendered page.
      #
      # @example
      #   course_page :course_start
      #
      # @since 0.1.0
      #
      def course_page(name)
        erb name, :layout => false
      end

      #
      # Renders a title string.
      #
      # @param [Array] names
      #   The names to put into the title.
      #
      # @return [String]
      #   The title.
      #
      # @example
      #   title_for 'HTTP Redirects'
      #   # => "Web Spider Obstacle Course :: HTTP Redirects"
      #
      # @since 0.1.0
      #
      def title_for(*names)
        (['Web Spider Obstacle Course'] + names).join(' :: ')
      end

      #
      # Generates a remote URL containing a given path.
      #
      # @param [String] path
      #   The path to include within the URL.
      #
      # @return [String]
      #   The remote URL.
      #
      # @example
      #   remote_url '/course/redirects/start.html'
      #   # => "http://localhost:8080/course/redirects/start.html"
      #
      # @since 0.1.0
      #
      def remote_url(path)
        s = "#{request.scheme}://#{request.host}"
        s << ":#{request.port}" if request.port != 80
        s << path

        return s
      end

      #
      # The course directory.
      #
      # @return [String]
      #   The course directory.
      #
      # @example
      #   course_dir
      #   # => "/course/"
      #
      # @since 0.1.0
      #
      def course_dir
        "#{Config::COURSE_DIR}/"
      end

      #
      # The full course starting URL.
      #
      # @return [String]
      #   The remote course starting URL.
      #
      # @example
      #   course_start
      #   # => "http://localhost:8080/course/start.html"
      #
      # @since 0.1.0
      #
      def course_start
        remote_url Config::COURSE_START_PATH
      end

      #
      # The full course failure URL.
      #
      # @return [String]
      #   The remote course failure URL.
      #
      # @example
      #   course_fail
      #   # => "http://localhost:8080/course/fail"
      #
      # @since 0.1.0
      #
      def course_fail
        remote_url Config::COURSE_FAIL_PATH
      end

      #
      # The specs for the course.
      #
      # @return [Array<Hash>]
      #   The Array of specs for each URL within the course.
      #
      # @since 0.1.0
      #
      def specs
        CourseSpecs.specs_for(request.host,request.port)
      end
    end
  end
end
