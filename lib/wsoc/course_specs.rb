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

require 'wsoc/specs'
require 'wsoc/config'

module WSOC
  module CourseSpecs
    include Specs

    should_ignore '/course/fail',
                  'should not visit links not part of the obstacle course'

    # Absolute Links
    should_visit '/course/absolute/start.html',
                 'should visit the absolute links start page'
    should_visit '/course/absolute/next.html',
                 'should visit absolute links to unvisited pages'

    # Empty Links
    should_visit '/course/empty/start.html',
                 'should visit the empty links start page'
    should_ignore '/course/empty/start.html%20',
                  'should ignore links with blank href attributes'

    # Frames
    should_visit '/course/frames/start.html',
                 'should visit the empty links start page'
    should_visit '/course/frames/iframe.html',
                 'should visit the contents of iframes'
    should_visit '/course/frames/iframe_contents.html',
                 'should visit links within iframes'
    should_visit '/course/frames/frame.html',
                 'should visit the contents of frames'
    should_visit '/course/frames/frame_contents.html',
                 'should visit links within frames'

    # Javascript Links
    should_visit '/course/javascript/start.html',
                 'should visit the javascript links start page'
    should_ignore '/course/javascript/start.html#',
                  'should ignore target links'
    should_ignore 'javascript:fail();',
                  'should ignore javascript: links'

    # Looping Links
    should_visit '/course/loop/start.html',
                 'should visit the looping links start page'
    should_visit '/course/loop/next.html',
                 'should visit non-circular linking pages'

    # Relative Links
    should_visit '/course/relative/start.html',
                 'should visit the relative links start page'
    should_ignore '/course/relative/start.html#',
                  'should ignore in-page anchor links'
    should_visit '/course/relative/normal.html',
                 'should visit normal relative links'
    should_visit '/course/relative/current_directory.html',
                 'should visit links relative to the current directory'
    should_visit '/course/relative/same_directory.html',
                 'should visit relative links that traverse directories'

    # Remote Links
    should_visit '/course/remote/start.html',
                 'should visit the remote links start page'
    should_ignore '/course/loop/../remote/start.html',
                  'should resolve the paths of remote links'
    should_visit '/course/remote/next.html',
                 'should visit normal remote links'
    should_fail 'http://spidr.rubyforge.org:1337/course/remote/fail.html',
                'should safely fail on closed ports'
    should_fail 'http://191.255.0.0/course/remote/fail.html',
                'should safely fail on unreachable IP Addresses'
    should_fail 'http://bad.tld/course/remote/fail.html',
                'should safely fail on host-names with invalid TLDs'
    should_fail 'http://bad.url.lol.com/course/remote/fail.html',
                'should safely fail on bad host-names'

    # Cookies
    should_visit '/course/cookies/start.html',
                 'should visit the cookies start page'
    should_visit '/course/cookies/get.html',
                 'should visit the cookies GET request test page'
    should_visit '/course/cookies/protected.html',
                 'should visit the first cookie protected page'

    # HTTP Redirects
    should_visit '/course/redirects/start.html',
                 'should visit the HTTP redirects start page'
    should_visit '/course/redirects/300.html',
                 'should visit the 300 HTTP redirect test page'
    should_visit '/course/redirects/300/pass.html',
                 'should follow HTTP 300 redirects'
    should_visit '/course/redirects/301.html',
                 'should visit the 301 HTTP redirect test page'
    should_visit '/course/redirects/301/pass.html',
                 'should follow HTTP 301 redirects'
    should_visit '/course/redirects/302.html',
                 'should visit the 302 HTTP redirect test page'
    should_visit '/course/redirects/302/pass.html',
                 'should follow HTTP 302 redirects'
    should_visit '/course/redirects/303.html',
                 'should visit the 303 HTTP redirect test page'
    should_visit '/course/redirects/303/pass.html',
                 'should follow HTTP 303 redirects'
    should_visit '/course/redirects/307.html',
                 'should visit the 307 HTTP redirect test page'
    should_visit '/course/redirects/307/pass.html',
                 'should follow HTTP 307 redirects'
    should_visit '/course/redirects/meta.html',
                 'should visit the meta refresh redirect test page'
    should_visit '/course/redirects/meta/pass.html',
                 'should follow meta refresh (soft) redirects'

    config :auth_store, {
      '/course/auth/' => {
        :user => Config::COURSE_AUTH_USER,
        :password => Config::COURSE_AUTH_PASSWORD
      }
    }

    # HTTP Auth
    should_visit '/course/auth/start.html',
                 'should visit the HTTP Auth start page'
    should_visit '/course/auth/protected.html',
                 'should visit the HTTP Auth protected page'
  end
end
