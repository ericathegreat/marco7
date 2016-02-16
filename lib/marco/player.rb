require 'singleton'
require_relative 'registry'
require_relative "interactions/quit_interaction"
require_relative "interactions/show_inventory_interaction"

class Player
	include Singleton

	attr_accessor :money, :inventory, :inventory_max_size, :location_stack

	def initialize
		@money = 10

		@inventory = []
		@inventory_max_size = 9

		@world_space_r = 10
		@world_space_c = 10
		@world = Registry.instance.map(:world)
	end

	def interactions player
		[
			Interactions::QuitInteraction.new(player),
			Interactions::ShowInventoryInteraction.new(player),
		]
	end

	def player_world_space= new_space
		@world_space_r = new_space[0]
		@world_space_c = new_space[1]
	end

	def player_world_space
		return @world_space_r, @world_space_c
	end

	def r
		@world_space_r
	end

	def c
		@world_space_c
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

	def can_afford cost
		cost <= @money
	end

	def buy product, cost
		@money -= cost
		@inventory << product.item
	end
end