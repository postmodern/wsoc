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

require 'json'
require 'yaml'

module WSOC
  module Helpers
    module Rendering
      #
      # Renders a partial template.
      #
      # @param [Symbol] page
      #   The name of the partial template.
      #
      # @param [Hash] options
      #   Additional options.
      #
      # @return [String]
      #   The rendered partial.
      #
      # @since 0.1.0
      #
      def partial(page,options={})
        erb "_#{page}".to_sym, options.merge(:layout => false)
      end

      #
      # Renders a page.
      #
      # @param [Symbol] page
      #   Name of the page to render.
      #
      # @param [Hash] options
      #   Additional options.
      #
      # @return [String]
      #   The rendered page.
      #
      # @since 0.1.0
      #
      def show(page,options={})
        erb(page,options)
      end

      #
      # Renders a JSON blob and sets the content-type accordingly.
      #
      # @param [Object] obj
      #   The object to encode.
      #
      # @return [String]
      #   The JSON encoded object.
      #
      # @since 0.1.0
      #
      def json(obj)
        content_type :json

        obj = obj.to_s unless obj.respond_to?(:to_json)
        return obj.to_json
      end

      #
      # Renders a YAML blob and sets the content-type accordingly.
      #
      # @param [Object] obj
      #   The object to encode.
      #
      # @return [String]
      #   The YAML encoded object.
      #
      # @since 0.1.0
      #
      def yaml(obj)
        content_type :yaml

        return YAML.dump(obj)
      end
    end
  end
end
