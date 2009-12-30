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

module WSOC
  module Specs
    def self.included(base)
      base.module_eval do
        def self.specs_for(host,port=nil)
          prefix = "http://#{host}"
          prefix << ":#{port}" if (port && port != 80)

          Specs.specs.map do |spec|
            spec.merge(:url => prefix + spec[:url])
          end
        end

        protected

        def self.should_visit(url,message=nil)
          Specs.should(:visit,:url => url, :message => message)
        end

        def self.should_ignore(url,message=nil)
          Specs.should(:ignore,:url => url, :message => message)
        end

        def self.should_fail(url,message=nil)
          Specs.should(:fail,:url => url, :message => message)
        end
      end
    end

    def Specs.specs
      @@wsoc_specs ||= []
    end

    def Specs.should(behavior,options)
      Specs.specs << {:behavior => behavior}.merge(options)
    end
  end
end
