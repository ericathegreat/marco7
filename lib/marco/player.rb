require 'singleton'
require_relative 'registry'
require_relative 'world_space_aware'
require_relative 'pathfinding'
require_relative 'interactions/show_inventory_interaction'
require_relative 'hud_states/noop'
require_relative 'hud_states/entity_selected'

class Player
	include Singleton
	include WorldSpaceAware

	attr_accessor :inventory, :inventory_max_size, :location_stack, :hud_state

	HUD_NOOP = HudStates::Noop.new

	def initialize
		@inventory = []
		@inventory_max_size = 9

		@world = Registry.instance.map(:world)
		self.world_space= [9,9]

		@hud_state = HUD_NOOP
		@pathfinder = Pathfinding.new(@world)
	end

	def interactions player
		[
			Interactions::ShowInventoryInteraction.new(player)
		]
	end

	def current_cell
		@world.cell_at(r,c)
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

	def engage_with entities
		if @hud_state == HUD_NOOP && entities != nil && entities.size > 0
			@hud_state = HudStates::EntitySelected.new entities
		else
			@hud_state = HUD_NOOP
		end
	end

	def find_path to
		@pathfinder.find_path current_cell, to
	end

end