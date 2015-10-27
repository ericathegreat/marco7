require_relative "interactions/quit_interaction"
require_relative "interactions/move_interaction"
require_relative "interactions/move_return_interaction"

class Player
	attr_accessor :money, :time_remaining

	def initialize starting_location
		@location_stack = [starting_location]
		@money = 0
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

	def location
		@location_stack.last
	end

	def interactions
		@quit_interaction ||= Interactions::QuitInteraction.new self

		interactions = []
		interactions << @quit_interaction
		interactions << Interactions::MoveReturnInteraction.new(self) unless @location_stack.size <=1
		interactions
	end
end