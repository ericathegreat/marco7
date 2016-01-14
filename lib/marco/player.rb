require 'singleton'
require_relative 'registry'
require_relative "interactions/quit_interaction"
require_relative "interactions/move_interaction"
require_relative "interactions/move_return_interaction"
require_relative "interactions/show_inventory_interaction"

class Player
	include Singleton

	attr_accessor :money, :inventory, :location_stack

	def initialize
		@location_stack = []
		@money = 10
		@inventory = []
		@world_space_r = 10
		@world_space_c = 10
		@world = Registry.instance.map(:world)
	end

	def interactions player
		[
			Interactions::QuitInteraction.new(player),
			Interactions::ShowInventoryInteraction.new(player),
			Interactions::MoveReturnInteraction.new(player)
		]
	end

	def player_world_space= new_space
		@world_space_r = new_space[0]
		@world_space_c = new_space[1]
	end

	def player_world_space
		return @world_space_r, @world_space_c
	end

	def player_world_space_move relative
		new_position = [(@world_space_r + relative[0]), (@world_space_c + relative[1])]
		can_walk = @world.can_walk( *new_position )
		if(can_walk)
			@world_space_r += relative[0]
			@world_space_c += relative[1]
		end
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
		location.leave
		@location_stack.push new_location
		location.arrive
	end

	def move_to! new_location
		@location_stack.push new_location
	end

	def move_back
		location.leave
		@location_stack.pop
		location.arrive
	end

	def can_afford cost
		cost <= @money
	end

	def buy product, cost
		@money -= cost
		@inventory << product.item
	end

	def location
		@location_stack.last
	end
end