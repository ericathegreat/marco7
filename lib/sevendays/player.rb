require_relative "interactions/quit_interaction"
require_relative "interactions/move_interaction"
require_relative "interactions/move_return_interaction"
require_relative "interactions/show_inventory_interaction"

class Player
	attr_accessor :money, :time_remaining, :inventory

	def initialize starting_location
		@location_stack = [starting_location]
		@money = 10
		@inventory = []
	end

	def report
		"Currently at #{location.name}\n$#{money} in cash"
	end

	def quit
		@quit = true
	end

	def quit?
		@quit ||= false
	end

	def move_to new_location
		@location_stack.push new_location
	end

	def move_back
		@location_stack.pop
	end

	def can_afford cost
		cost <= @money
	end

	def buy product, cost
		@money -= cost
		@inventory << product
	end

	def location
		@location_stack.last
	end

	def interactions
		@base_interactions ||= [
			Interactions::QuitInteraction.new(self),
			Interactions::ShowInventoryInteraction.new(self)
		]

		interactions = @base_interactions
		interactions +=[ Interactions::MoveReturnInteraction.new(self)] unless @location_stack.size <=1
		interactions
	end
end