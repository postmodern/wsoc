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

module WSOC
  module CourseSpecs
    include Specs

    # absolute links
    should_visit '/course/absolute/start.html', 'should visit the absolute links start page'
    should_visit '/course/absolute/next.html', 'should visit absolute links to unvisited pages'

    # empty links
    should_visit '/course/empty/start.html ', 'should visit the empty links start page'
    should_ignore '/course/empty/start.html ', 'should ignore links with blank href attributes'
    should_ignore '/course/empty/start.html%20', 'should ignore links with blank href attributes'

    # frames
    should_visit '/course/frames/start.html ', 'should visit the empty links start page'
    should_visit '/course/frames/iframe.html ', 'should visit the contents of iframes'
    should_visit '/course/frames/iframe_next.html ', 'should visit links within iframes'
    should_visit '/course/frames/frame.html ', 'should visit the contents of frames'
    should_visit '/course/frames/frame_next.html ', 'should visit links within frames'

    # javascript
    should_visit '/course/javascript/start.html', 'should visit the javascript links start page'
    should_ignore '/course/javascript/start.html#', 'should ignore target links'
    should_ignore 'javascript:fail();', 'should ignore javascript: links'

    # looping links
    should_visit '/course/loop/start.html', 'should visit the looping links start page'
    should_visit '/course/loop/next.html', 'should visit non-circular linking pages'

    # relative links
    should_visit '/course/relative/start.html', 'should visit the relative links start page'
    should_ignore '/course/relative/start.html#', 'should ignore in-page anchor links'
    should_visit '/course/relative/normal.html', 'should visit normal relative links'
    should_visit '/course/relative/current_directory.html', 'should visit links relative to the current directory'
    should_visit '/course/relative/same_directory.html', 'should visit relative links that traverse directories'

    # remote links
    should_visit '/course/remote/start.html', 'should visit the remote links start page'
    should_ignore '/course/loop/../remote/start.html', 'should resolve the paths of remote links'
    should_visit '/course/remote/next.html', 'should visit normal remote links'
    should_fail '/course/remote/fail.html', 'should safely fail on bad remote links'
  end
end
