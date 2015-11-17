require 'singleton'

module Registries
	class ScreenRegistry
		include Singleton

		def initialize
			@screens = Hash.new
		end

		def screen_for location_stack
			best_match = location_stack.reverse.find do |location|
				@screens.has_key? location.name
			end
			best_match.nil? ? nil : @screens[best_match.name]
		end

		def register_screen location_name, screen
			puts "Registered screen for #{location_name}"
			@screens[location_name] = screen
		end

		def associate_all
			@screens.values.each { |s| s.associate }
		end
	end
end