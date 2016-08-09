require 'gosu'
require 'ashton'
require_relative '../registry'
require_relative 'iso_space'
require_relative 'fx/grass_noise'
require_relative 'fx/water_noise'
require_relative '../geography/world_map'

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

			@world_pix_high = ROW_HEIGHT * Geography::WorldMap::WORLD_SIZE / 2.0
			@world_pix_wide = COLUMN_WIDTH * Geography::WorldMap::WORLD_SIZE / 2.0
		end

		def draw window
			tl = render_center
			grass_shader = UI::FX::GrassNoise.shader(-tl[0], tl[1])
			water_shader = UI::FX::WaterNoise.shader(-tl[0], tl[1])

			# Draw grass separately for shadering
      for_each_tile_on_screen do |r, c|
				draw_terrain r, c unless @place.cell_at(r,c).terrain_type == :grass || 
					 @place.cell_at(r,c).terrain_type == :water
			end

	    window.post_process water_shader do
	      for_each_tile_on_screen do |r, c|
					draw_terrain r, c if @place.cell_at(r,c).terrain_type == :water
				end
	    end

	    window.post_process grass_shader do
	      for_each_tile_on_screen do |r, c|
					draw_terrain r, c if @place.cell_at(r,c).terrain_type == :grass
				end
	    end

      for_each_tile_on_screen do |r, c|
				draw_structures r, c
			end

			@player.draw( LAYER_PLAYER, Player.instance )
		end

		def draw_terrain r, c
			terrain = @place.cell_at(r, c).terrain_type
			@tiles[terrain].draw( LAYER_GROUND, @place.cell_at(r,c) )
		end


		def draw_structures r, c
			@place.cell_at(r, c).structures.each do | structure |
				@tiles[structure.to_sym].draw( LAYER_STRUCTURE, @place.cell_at(r,c) )
			end
		end

		def update(milliseconds)
			Player.instance.update(milliseconds)

			if Gosu.button_down?( Gosu::KbUp )
				Player.instance.move [-0.05,-0.05]
			end
			if Gosu.button_down?( Gosu::KbDown )
				Player.instance.move [0.05,0.05]
			end
			if Gosu.button_down?( Gosu::KbLeft )
				Player.instance.move [-0.05, 0.05]
			end
			if Gosu.button_down?( Gosu::KbRight )
				Player.instance.move [0.05,-0.05]
			end
		end

		def click x, y
			world_space = screen_to_world(y, x).map{|a| a.round}
			# puts world_space.inspect
			# puts Player.instance.world_space.inspect
			Player.instance.engage_with(@place.cell_at(*world_space).structures.collect)
		end
	end
end