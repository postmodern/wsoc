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

module WSOC
  module SpecParser
    def self.included(base)
      base.module_eval do
        def self.link_to_spec(path,link)
          relative_path = (link.get_attribute('href') || '')
          absolute_path = URI.expand_path(File.join('',path,relative_path))

          return {
            :message => link.inner_text,
            :link => relative_path,
            :url => absolute_path,
            :example => link.to_html
          }
        end

        def self.parse_page(path)
          doc = Nokogiri::HTML(open(path))

          doc.search('.follow//a').each do |follow|
            Specs << link_to_spec(path,follow).merge(:behavior => :follow)
          end

          doc.search('.nofollow//a').each do |nofollow|
            Specs << link_to_spec(path,nofollow).merge(:behavior => :nofollow)
          end

          doc.search('.ignore//a').each do |ignore|
            Specs << link_to_spec(path,ignore).merge(:behavior => :ignore)
          end

          doc.search('.fail//a').each do |failed|
            Specs << link_to_spec(path,failed).merge(:behavior => :fail)
          end
        end

        Dir[File.join(self.course,'**','*.html')].each do |page|
          self.parse_page(page)
        end
      end
    end
  end
end
