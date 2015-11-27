require 'singleton'
require_relative 'sevendays/registries/registry'

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

		Registries::Registry.instance.screens.values.each { |s| s.associate }
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