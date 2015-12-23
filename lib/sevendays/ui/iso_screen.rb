require 'gosu'
require_relative '../registry'

module UI
	class IsoScreen

		ROW_HEIGHT = 32
		COLUMN_WIDTH = 64
		MAX_LAYERS = 2

		LAYER_GROUND = 0
		LAYER_WALL = 1
		LAYER_PLAYER = 2

		def associate
			@place = Registry.instance.map(:world)
			@tiles = Registry.instance.sprites
			@player = Registry.instance.sprite(:player)
		end

		def draw
			r_world_top_left, c_world_top_left = screen_to_world(0, 0)

			@draw_columns ||= (GameWindow::WINDOW_WIDE/COLUMN_WIDTH/2 + 1).ceil
			@draw_rows ||= (GameWindow::WINDOW_HIGH/ROW_HEIGHT/2 + 1).ceil

			(-1..@draw_columns).each do |r|
				(-1..@draw_rows).each do |c|
					draw_location (r_world_top_left.floor + r + c), (c_world_top_left.floor + c - r)
					draw_location (r_world_top_left.floor + r + c + 1), (c_world_top_left.floor + c - r)
				end
			end
			@player.draw( *world_to_screen(*Player.instance.player_world_space, LAYER_PLAYER) )
		end

		def draw_location r, c
			draw_tile r, c
			draw_wall r, c
		end


		def draw_tile r, c
			terrain = @place.cell_at(r, c).terrain_type
			@tiles[terrain].draw( *world_to_screen(r, c, LAYER_GROUND) )
		end

		def draw_wall r, c
			[:west, :north].each do |orientation|
				wall = @place.wall_at(r, c, orientation)
				if (wall != nil)
					@tiles[wall.wall_type].draw(*world_to_screen(r, c, LAYER_WALL), orientation)#, COLUMN_WIDTH, ROW_HEIGHT )
				end
			end
		end

		def render_center
			return world_to_render(*Player.instance.player_world_space)
		end

		def world_to_render r_world, c_world
			r_px_render = (r_world + c_world) * ROW_HEIGHT
			c_px_render = (-c_world + r_world) * COLUMN_WIDTH
			[r_px_render, c_px_render, (c_world + r_world)]
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
			r_origin, c_origin = render_center
			c_px_render = c_origin + c_px_screen - GameWindow::WINDOW_WIDE/2
			r_px_render = r_origin + r_px_screen - GameWindow::WINDOW_HIGH/2

			r = ((c_px_render / COLUMN_WIDTH) + (r_px_render / ROW_HEIGHT)) / 2
			c = r_px_render / ROW_HEIGHT - r
			[r, c]
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