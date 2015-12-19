require 'gosu'
require_relative '../registry'

module UI
	class IsoScreen

		ROW_HEIGHT = 32
		COLUMN_WIDTH = 64
		MAX_LAYERS = 2

		def associate
			@place = Registry.instance.map('World')
			@tiles = Registry.instance.sprites
			@player = Registry.instance.sprite(:player)
		end

		def draw #132 pixels wide
			(-1..20).each do |r|
				(-1..20).each do |c|
					draw_tile r,c
				end
			end
			@player.draw( *world_to_screen(*Player.instance.player_world_space, 1) )
		end

		def draw_tile r, c
			terrain = @place.cell_at(r, c).terrain_type
			@tiles[terrain].draw( *world_to_screen(r, c, 0) )
		end

		def render_center
			return world_to_render(*Player.instance.player_world_space)
		end

		def world_to_render r_world, c_world
			r_px_render = (r_world + c_world) * ROW_HEIGHT
			c_px_render = (-c_world + r_world) * COLUMN_WIDTH
			[r_px_render, c_px_render, (c_world + r_world).ceil]
		end

		def world_to_screen r_world, c_world, layer
			r_px_render, c_px_render, z_render = world_to_render(r_world, c_world)

			r_center, c_center = render_center

			x_top_left = c_center - GameWindow::WINDOW_WIDE/2
			y_top_left = r_center - GameWindow::WINDOW_HIGH/2
			#x,y,z
			[c_px_render - x_top_left, 
				r_px_render - y_top_left, 
				z_render * MAX_LAYERS + layer]
		end

		def screen_to_world r_px_screen, c_px_screen
			r_origin, c_origin = render_top_left
			c_px_render = c_px_screen + c_origin - GameWindow::WINDOW_WIDE/2
			r_px_render = r_px_screen + r_origin - GameWindow::WINDOW_HIGH/2

			r = ((c_px_render / COLUMN_WIDTH) + (r_px_render / ROW_HEIGHT)) / 2
			c = r_px_render / ROW_HEIGHT - r
			[r, c]
		end


		def key_hold id
			case(id)
				when Gosu::KbUp
					Player.instance.player_world_space_move [-0.1,0]
				when Gosu::KbDown
					Player.instance.player_world_space_move [0.1,0]
				when Gosu::KbLeft
					Player.instance.player_world_space_move [0, 0.1]
				when Gosu::KbRight
					Player.instance.player_world_space_move [0,-0.1]
			end
		end

		def click x, y
			# puts screen_to_world(y, x).map{|a| a.round}.inspect
			#r_origin, c_origin = Player.instance.player_world_space
			#Player.instance.player_world_space= [y - (GameWindow::WINDOW_WIDE/2) + r_origin, x - ( GameWindow::WINDOW_HIGH/2) + c_origin]
		end
	end
end