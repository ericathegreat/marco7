require 'gosu'
require_relative '../registry'
require_relative 'iso_space'

module UI
	class IsoScreen
		include IsoSpace

		LAYER_GROUND = 0
		# LAYER_WALL = 1
		LAYER_PLAYER = 0

		def associate
			@place = Registry.instance.map(:world)
			@tiles = Registry.instance.sprites
			@player = Registry.instance.sprite(:player)
		end

		def draw
			for_each_tile_on_screen do |r, c|
				draw_tile r, c
			end

			@player.draw( *world_to_screen(*Player.instance.player_world_space, LAYER_PLAYER) )
		end

		def draw_tile r, c
			terrain = @place.cell_at(r, c).terrain_type
			@tiles[terrain].draw( *world_to_screen(r, c, LAYER_GROUND) )
		end

		def update
			if Gosu.button_down?( Gosu::KbUp )
				Player.instance.player_world_space_move [-0.05,-0.05]
			end
			if Gosu.button_down?( Gosu::KbDown )
				Player.instance.player_world_space_move [0.05,0.05]
			end
			if Gosu.button_down?( Gosu::KbLeft )
				Player.instance.player_world_space_move [-0.05, 0.05]
			end
			if Gosu.button_down?( Gosu::KbRight )
				Player.instance.player_world_space_move [0.05,-0.05]
			end
		end

		def click x, y
			puts screen_to_world(y, x).map{|a| a.round}.inspect
		end
	end
end