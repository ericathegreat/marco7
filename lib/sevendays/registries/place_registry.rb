require 'singleton'

module Registries
	class PlaceRegistry
		include Singleton

		attr_reader :places

		def initialize
			@places = Hash.new
		end

		def for_name place_name
			@places[place_name]
		end

		def register place
			@places[place.name] = place

			puts "Registered #{place.name}"
		end

	end
end
