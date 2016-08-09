module UI
	module IsoSpace

		ROW_HEIGHT = 32
		COLUMN_WIDTH = 64
		MAX_LAYERS = 2

		WINDOW_PADDING = 1
		
		def render_center
			return world_to_render(*Player.instance.world_space)
		end

		def for_each_tile_on_screen
			r_world_top_left, c_world_top_left = screen_to_world(0, 0)

			(-WINDOW_PADDING..draw_columns).each do |r|
				(-WINDOW_PADDING..draw_rows).each do |c|
					yield (r_world_top_left.floor + r + c), (c_world_top_left.floor + c - r)
					yield (r_world_top_left.floor + r + c + 1), (c_world_top_left.floor + c - r)
				end
			end
		end

		def draw_columns
			@draw_columns ||= (GameWindow::WINDOW_WIDE/COLUMN_WIDTH/2 + WINDOW_PADDING).ceil
		end

		def draw_rows
			@draw_rows ||= (GameWindow::WINDOW_HIGH/ROW_HEIGHT/2 + WINDOW_PADDING).ceil
		end

		def screen_to_render  r_px_screen, c_px_screen
			world = screen_to_world(r_px_screen, c_px_screen);
			world_to_render( world[0], world[1] )
		end

		def world_to_render r_world, c_world
			r_px_render = (r_world + c_world) * ROW_HEIGHT
			c_px_render = (r_world - c_world) * COLUMN_WIDTH
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

	end
end