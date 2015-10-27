require_relative 'interactions/move_interaction'

class Place
	attr_reader :name, :locations

	def initialize name, locations = []
		@name = name
		@locations = locations
	end

	def interactions player
		all = @locations.map do |location|
			Interactions::MoveInteraction.new(self, location, player)
		end
	end

	def add_connected_location location
		@locations << location
	end
end