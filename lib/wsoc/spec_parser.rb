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

require 'wsoc/extensions/uri'
require 'wsoc/specs'

require 'nokogiri'
require 'uri'

module WSOC
  module SpecParser
    def self.included(base)
      base.module_eval do
        def self.link_to_spec(source,link,behavior)
          dest = (link.get_attribute('href') || '')

          return {
            :behavior => behavior.to_sym,
            :source => source,
            :dest => dest,
            :message => link.inner_text,
            :example => link.to_html
          }
        end

        def self.parse_page(path)
          doc = Nokogiri::HTML(open(path))
          source = path.sub(self.course,'')

          doc.search('.follow//a').each do |follow|
            Specs << link_to_spec(source,follow,:follow)
          end

          doc.search('.nofollow//a').each do |nofollow|
            Specs << link_to_spec(source,nofollow,:nofollow)
          end

          doc.search('.ignore//a').each do |ignore|
            Specs << link_to_spec(source,ignore,:ignore)
          end

          doc.search('.fail//a').each do |failed|
            Specs << link_to_spec(source,failed,:fail)
          end
        end

        Dir[File.join(self.course,'**','*.html')].each do |page|
          self.parse_page(page)
        end
      end
    end
  end
end
