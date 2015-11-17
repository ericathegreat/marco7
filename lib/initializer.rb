require 'singleton'
require_relative 'sevendays/registries/screen_registry'

class Initializer
	include Singleton

	def run
		puts "Initializing"
		
		Dir["#{File.dirname(__FILE__)}/sevendays/initializers/*.rb"].each do |file| 
			puts "required #{file}"
			require file
		end

		@registrations.each { |r| r.call(self) }
		@associations.each { |a| a.call(self) }

		Registries::ScreenRegistry.instance.associate_all
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