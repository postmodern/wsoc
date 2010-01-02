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

require 'wsoc/version'

module WSOC
  module Config
    # Default host to run the WSOC server on
    DEFAULT_HOST = 'localhost'

    # Default port to run the WSOC server on
    DEFAULT_PORT = 8080

    # Paths to the specs files
    SPECS_PATHS = {
      :json => '/specs.json',
      :yaml => '/specs.yaml'
    }

    # Course directory
    COURSE_DIR = '/course'

    # Path to the start of the course
    COURSE_START_PATH = "#{COURSE_DIR}/start.html"

    # Path to the course failure page
    COURSE_FAIL_PATH = "#{COURSE_DIR}/fail"
  end
end
