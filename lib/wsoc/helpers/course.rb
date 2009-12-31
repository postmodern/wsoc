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

require 'wsoc/config'
require 'wsoc/course_specs'

module WSOC
  module Helpers
    module Course
      def title_for(name)
        "Web Spider Obstacle Course :: #{name}"
      end

      def remote_url(path)
        s = "#{request.scheme}://#{request.host}"
        s << ":#{request.port}" if request.port != 80
        s << path

        return s
      end

      def course_dir
        "#{COURSE_DIR}/"
      end

      def course_start
        remote_url COURSE_START_PATH
      end

      def course_fail
        remote_url COURSE_FAIL_PATH
      end

      def specs
        CourseSpecs.specs_for(request.host,request.port)
      end
    end
  end
end
