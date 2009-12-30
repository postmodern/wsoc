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
  module Spec
    def self.included(base)
      base.module_eval do
        protected

        def self.should_visit(url,message=nil)
          Spec.should(:visit,:url => url, :message => message)
        end

        def self.should_ignore(url,message=nil)
          Spec.should(:ignore,:url => url, :message => message)
        end

        def self.should_fail(url,message=nil)
          Spec.should(:fail,:url => url, :message => message)
        end
      end
    end

    def Spec.specs
      @@wsoc_spec_specs ||= []
    end

    def Spec.should(behavior,options)
      Spec.specs << {:behavior => behavior}.merge(options)
    end

    def Spec.map(host,port=nil)
      url = URI::HTTP.build(:host => host, :port => port)

      Spec.specs.map do |spec|
        link = url.clone
        link.path = spec[:url]

        spec.merge(:link => link.to_s)
      end
    end
  end
end
