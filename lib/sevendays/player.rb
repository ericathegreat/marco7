require_relative "interactions/quit_interaction"
require_relative "interactions/move_interaction"
require_relative "interactions/move_return_interaction"
require_relative "interactions/show_inventory_interaction"
require_relative "interactable"

class Player
	include Interactable

	attr_accessor :money, :time_remaining, :inventory

	def initialize starting_location
		@location_stack = [starting_location]
		@money = 10
		@inventory = []

		has_interaction Interactions::QuitInteraction.new
		has_interaction Interactions::ShowInventoryInteraction.new
		has_interaction Interactions::MoveReturnInteraction.new
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

	def can_return?
		@location_stack.size > 1
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
end