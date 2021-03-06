#
# WSOC - The Web Spider Obstacle Course
#
# Copyright (c) 2009-2011 Hal Brodigan (postmodern.mod3 at gmail.com)
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

require 'wsoc/config'
require 'wsoc/app'

require 'optparse'

module WSOC
  class Runner

    # Host to run the WSOC server on
    attr_reader :host

    # Port to run the WSOC server on
    attr_reader :port

    #
    # Creates a new runner.
    #
    # @since 0.1.0
    #
    def initialize
      @host = Config::DEFAULT_HOST
      @port = Config::DEFAULT_PORT
      @handler = nil
    end

    #
    # Starts the runner.
    #
    # @param [Array<String>] argvs (ARGV)
    #   The arguments to run the runner with.
    #
    # @since 0.1.0
    #
    def Runner.start(args=ARGV)
      runner = self.new()
      runner.run(*args)
    end

    #
    # Runs the runner.
    #
    # @param [Array<String>] args
    #   The arguments to run the runner with.
    #
    # @since 0.1.0
    #
    def run(*args)
      optparse(*args)

      options = {
        :env => :production,
        :host => @host,
        :port => @port
      }

      options.merge!(:server => @handler) if @handler

      App.run!(options)
    end

    protected

    #
    # Parses the given arguments.
    #
    # @param [Array<String>] args
    #   The arguments to parse.
    #
    # @since 0.1.0
    #
    def optparse(*args)
      opts = OptionParser.new

      opts.banner = "usage: #{$0} [options]"

      opts.on('-H','--host HOST',"The host to run the server on","Default: #{@host}") do |host|
        @host = host
      end

      opts.on('-p','--port PORT',"The port to run the server on","Default: #{@port}") do |port|
        @port = port.to_i
      end

      opts.on('--s','--server NAME','Rack handler to run the server under') do |handler|
        @handler = handler
      end

      opts.on('-h','--help','Display the help output') do
        puts opts
        exit
      end

      begin
        opts.parse!(args)
      rescue OptionParser::InvalidOption => e
        STDERR.puts e.message
        STDERR.puts opts
        exit -1
      end
    end

  end
end
