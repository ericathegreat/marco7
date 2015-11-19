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
			Interactions::MoveInteraction.new(self, player)
		end

		def contents
			@locations
		end

		def register
			Registries::PlaceRegistry.instance.register self
		end

		def arrive
		end

		def leave
		end
	end
end