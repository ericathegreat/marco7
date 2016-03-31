require_relative '../player'
require_relative '../clock'
require_relative 'iso_space'
module UI
	class Hud
		include IsoSpace

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
				hud_state = @player.hud_state
				menu_center = world_to_screen hud_state.engaged_entity.r, hud_state.engaged_entity.c, 0
				hud_state.available_actions.each_with_index do | interaction, i |
					@font.draw(interaction.display_text, menu_center[0], menu_center[1] + 50 * i, 1024, 2, 2)
				end
			end
		end

		def draw_clock
      @font.draw(@clock.report, 500,0,1024,4,4)
		end
	end
end