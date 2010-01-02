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
  module Specs
    def self.included(base)
      base.module_eval do
        def self.specs
          @@specs ||= []
        end

        def self.should(behavior,options)
          self.specs << {:behavior => behavior}.merge(options)
        end

        def self.specs_for(host,port=nil)
          prefix = "http://#{host}"
          prefix << ":#{port}" if (port && port != 80)

          self.specs.map do |spec|
            unless spec[:url] =~ /^[a-zA-Z0-9]+:/
              spec.merge(:url => prefix + spec[:url])
            else
              spec
            end
          end
        end

        protected

        def self.should_visit(url,message=nil)
          self.should(:visit,:url => url, :message => message)
        end

        def self.should_ignore(url,message=nil)
          self.should(:ignore,:url => url, :message => message)
        end

        def self.should_fail(url,message=nil)
          self.should(:fail,:url => url, :message => message)
        end
      end
    end
  end
end
