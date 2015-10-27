require_relative '../interactions/move_interaction'
require_relative '../interactable'

module Places
	class Place
		include Interactable
		attr_reader :name, :locations

		def initialize name
			@name = name
			@locations = []
		end

		def add_connected_location location
			@locations << location
			has_interaction Interactions::MoveInteraction.new(self, location)
		end
	end
end