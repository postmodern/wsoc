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

require 'json'

module WSOC
  module Helpers
    module Rendering
      def partial(page,options={})
        erb "_#{page}".to_sym, options.merge(:layout => false)
      end

      def show(page,options={})
        erb(page,options)
      end

      def json(obj)
        content_type :json

        obj = obj.to_s unless obj.respond_to?(:to_json)
        return obj.to_json
      end
    end
  end
end
