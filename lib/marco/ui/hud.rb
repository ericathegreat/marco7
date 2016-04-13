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
			if @player.hud_state.show_interactions?
				clear_click_map
				hud_state = @player.hud_state

				menu_center = world_to_screen hud_state.engaged_entity.r, hud_state.engaged_entity.c, 0
				hud_state.available_actions.each_with_index do | interaction, i |
					top_left = menu_center[0], menu_center[1] + 50 * i
					font_scale = 2
					@font.draw(interaction.display_text, top_left[0], top_left[1], 1024, font_scale, font_scale)
					define_zone(
						(text_polygon interaction.display_text, top_left, font_scale), 
						interaction)
				end
			end
		end

		def text_polygon text, top_left, scale
			text_width = @font.text_width(text, scale)
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