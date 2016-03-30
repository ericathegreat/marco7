require_relative '../player'
require_relative '../clock'
module UI
	class Hud

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
			if @player.interacting
				@player.available_actions.each_with_index do | interaction, i |
					puts @player.engaged_entity
					@font.draw(interaction.display_text, 200, 50 * i, 1024, 2, 2)
				end
			end
		end

		def draw_clock
      @font.draw(@clock.report, 500,0,1024,4,4)
		end
	end
end