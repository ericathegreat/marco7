require_relative '../interactions/move_interaction'
require_relative '../registries/place_registry'

module Places
	class Place
		attr_reader :name, :locations

		def initialize name
			@name = name
			@locations = []
		end

		def add_connected_location location
			@locations << location
		end

		def interactions player
			@locations.map do |location|
				Interactions::MoveInteraction.new(self, location, player)
			end
		end

		def register
			Registries::PlaceRegistry.instance.register self
		end
	end
end