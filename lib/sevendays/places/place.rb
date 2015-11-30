require_relative '../interactions/move_interaction'
require_relative '../registry'

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
			Registry.instance.register_place self.name, self
		end

		def arrive
		end

		def leave
		end
	end
end