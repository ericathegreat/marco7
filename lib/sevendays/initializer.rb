require 'singleton'
require_relative 'registries/place_registry'

class Initializer
	include Singleton

	def run
		puts "Initializing"
		
		Dir["#{File.dirname(__FILE__)}/initializers/*.rb"].each do |file| 
			puts "required #{file}"
			require file
		end

		@registrations.each { |r| r.call(self) }
		@associations.each { |a| a.call(self) }
	end

	def register &block
		@registrations ||= Array.new
		@registrations << block
	end

	def associate &block
		@associations ||= Array.new
		@associations << block
	end

end