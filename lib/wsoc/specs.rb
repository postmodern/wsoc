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

require 'uri'

module WSOC
  module Specs
    def Specs.all
      @@wsoc_specs_all ||= []
    end

    def Specs.<<(spec)
      Specs.all << spec
    end

    def Specs.map(host,port=nil)
      Specs.all.map do |spec|
        link = URI::HTTP.build(
          :host => host,
          :port => port,
          :path => spec[:link]
        ).to_s

        url = URI::HTTP.build(
          :host => host,
          :port => port,
          :path => spec[:url]
        ).to_s

        spec.merge(:link => link, :url => url)
      end
    end
  end
end