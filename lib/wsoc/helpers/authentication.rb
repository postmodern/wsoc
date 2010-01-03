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

module WSOC
  module Helpers
    module Authentication

      #
      # Protects an action by requiring HTTP Basic Access Authentication.
      #
      # @yield []
      #   If a block is given, it will be called if the client is
      #   authenticated.
      #
      # @since 0.1.1
      #
      def protected!(&block)
        if authorized?
          block.call() if block
        else
          response['WWW-Authenticate'] = %(Basic realm="HTTP Auth Test")
          throw :halt, [401, "Not authorized\n"]
        end
      end

      # 
      # Checks to see if the requesting user is authorized.
      #
      # @return [Boolean]
      #   Specifies whether or not the client is authenticated.
      #
      # @since 0.1.1
      #
      def authorized?
        @auth ||=  Rack::Auth::Basic::Request.new(request.env)

        @auth.provided? && \
        @auth.basic? && \
        @auth.credentials && \
        @auth.credentials == [
          WSOC::Config::COURSE_AUTH_USER,
          WSOC::Config::COURSE_AUTH_PASSWORD
        ]
      end
    end
  end
end
