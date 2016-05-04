require 'gosu'
require_relative '../registry'
require_relative 'iso_space'

module UI
	class IsoScreen
		include IsoSpace

		LAYER_GROUND 		= 0
		LAYER_STRUCTURE = 2
		LAYER_PLAYER 		= 2

		def associate
			@place = Registry.instance.map(:world)
			@tiles = Registry.instance.sprites
			@player = Registry.instance.sprite(:player)
		end

		def draw
			for_each_tile_on_screen do |r, c|
				draw_tile r, c
			end

			@player.draw( LAYER_PLAYER, Player.instance )
		end

		def draw_tile r, c
			terrain = @place.cell_at(r, c).terrain_type
			@tiles[terrain].draw( LAYER_GROUND, @place.cell_at(r,c) )
			@place.cell_at(r, c).structures.each do | structure |
				@tiles[structure.to_sym].draw( LAYER_STRUCTURE, @place.cell_at(r,c) )
			end
		end

		def update(milliseconds)
			Player.instance.update(milliseconds)

			if Gosu.button_down?( Gosu::KbUp )
				Player.instance.move [-0.05,-0.05]
			end
			# if Gosu.button_down?( Gosu::KbDown )
			# 	Player.instance.move [0.05,0.05]
			# end
			# if Gosu.button_down?( Gosu::KbLeft )
			# 	Player.instance.move [-0.05, 0.05]
			# end
			# if Gosu.button_down?( Gosu::KbRight )
			# 	Player.instance.move [0.05,-0.05]
			# end
		end

		def click x, y
			world_space = screen_to_world(y, x).map{|a| a.round}
			# puts world_space.inspect
			# puts Player.instance.world_space.inspect
			Player.instance.engage_with(@place.cell_at(*world_space).structures.collect)
		end
	end
end