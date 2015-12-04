require 'singleton'
require_relative 'sevendays/registry'

class Initialize
	include Singleton

	def run
		puts "Initializing"
		
		Dir["#{File.dirname(__FILE__)}/sevendays/initializers/*.rb"].each do |file| 
			puts "required #{file}"
			require file
		end

		@registrations.each { |r| r.call }
		@associations.each { |a| puts "calling #{a} with #{Registry.instance}"
		a.call(Registry.instance) }

		Registry.instance.screens.values.each { |s| s.associate }
	end

	def register &block
		@registrations ||= Array.new
		@registrations << block
	end

	def associate &block
		@associations ||= Array.new
		@associations << block
		puts block.arity
	end

end