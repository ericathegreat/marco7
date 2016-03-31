require 'singleton'
require_relative 'registry'
require_relative 'world_space_aware'
require_relative "interactions/quit_interaction"
require_relative "interactions/show_inventory_interaction"

class Player
	include Singleton
	include WorldSpaceAware

	attr_accessor :inventory, :inventory_max_size, :location_stack

	def initialize
		@inventory = []
		@inventory_max_size = 9

		@world = Registry.instance.map(:world)
		self.world_space= [10,10]

		@interacting_with = nil 
	end

	def interactions player
		[
			Interactions::QuitInteraction.new(player),
			Interactions::ShowInventoryInteraction.new(player),
		]
	end

	def neighbouring_interactions
		neighbouring_cells.collect do |cell|
			cell.structures.collect {|s| cell}
		end.flatten
	end

	def neighbouring_cells
		@world.cell_at(r,c).neighbours.cells
	end

	def move relative
		new_position = [(@world_space_r + relative[0]), (@world_space_c + relative[1])]
		can_walk = @world.can_walk( *new_position )
		if(can_walk)
			world_space_move relative
		end
	end

	def engage_with entity
		if @interacting_with == entity
			@interacting_with = nil
		else
			@interacting_with = entity
		end
	end

	def engaged_entity
		@interacting_with.first
	end

	def interacting
		@interacting_with != nil
	end

	def available_actions
		if @interacting_with == nil
			@interactions = []
		else
			@interactions = @interacting_with.each do |c|
				c.interactions
			end.flatten
		end
	end

	def quit
		@quit = true
	end

	def quit?
		@quit ||= false
	end
end