require_relative '../player'
require_relative '../clock'
require_relative 'iso_space'
require_relative 'image_map'
require 'geometry'

module UI
	class Hud
		include IsoSpace
		include ImageMap

		def associate
			@player = Player.instance
			@clock = Clock.instance

      @font = Gosu::Font.new 12			

			@z = 4096
			@inventory_background = Registry.instance.sprite(:inventory_item_back)
		end

		def draw
			draw_inventory
			draw_clock
			draw_interactions
		end

		def draw_inventory
			@player.inventory_max_size.times do |i|
				@inventory_background.screen_space_draw(120 + 120*i,GameWindow::WINDOW_HIGH - 80, @z)
			end
		end

		def draw_interactions
			hud_state = @player.hud_state
			if hud_state.show_interactions?
				clear_click_map

				font_scale = 2
				total_interactions = hud_state.available_actions.size

				menu_center = world_to_screen hud_state.engaged_entity.r, hud_state.engaged_entity.c, 0

				hud_state.available_actions.each_with_index do | interaction, i |
					text = interaction.display_text
					text_width = @font.text_width(text, font_scale)
					top_left = text_top_left menu_center, i, total_interactions, text_width

					@font.draw(text, top_left[0], top_left[1], 1024, font_scale, font_scale)
					define_zone( text_polygon(text_width, top_left, font_scale), interaction )
				end
			end
		end

		def text_top_left menu_center, interaction_number, total_interactions, text_width
			pie_radius = 80
			
			inner_offset = point_distributed_around_circle(pie_radius, interaction_number, total_interactions)

			top_left = []
			top_left[0] = menu_center[0] + inner_offset[0]
			top_left[1] = menu_center[1] + inner_offset[1]
			if inner_offset[0] <= 0
				top_left[0] = top_left[0]	- text_width
			end
			top_left
		end

		def point_distributed_around_circle (r, current_point, total_points) 
	    theta = 6.283 / total_points #6.283 = 2*pi
	    angle = theta * current_point

	    point_x = (r * Math.cos(angle));
	    point_y = (r * Math.sin(angle));

	    [point_x, point_y]
		end

		def text_polygon text_width, top_left, scale
			pad = 5
			Geometry::Polygon.new([
				Point(top_left[0] - pad, top_left[1] - pad),
				Point(top_left[0] + text_width + pad, top_left[1] - pad), 
				Point(top_left[0] + text_width + pad, top_left[1] + @font.height + pad), 
				Point(top_left[0] - pad, top_left[1] + @font.height + pad)])
		end

		def draw_clock
      @font.draw(@clock.report, 500,0,1024,4,4)
		end

		def click x, y
			if @player.hud_state.show_interactions?
				interaction = interactions_under(Point(x,y)).first
				interaction.execute unless interaction == nil
			end
			return false
		end
	end
end