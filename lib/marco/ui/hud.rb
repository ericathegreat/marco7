require_relative '../player'
require_relative '../clock'
require_relative 'inventory'
require_relative 'pie_menu'
require_relative 'iso_space'
require_relative 'image_map'

module UI
	class Hud
		include IsoSpace
		include ImageMap

		def associate
			@player = Player.instance
			@clock = Clock.instance

			@z = 4096

			@inventory_painter = Inventory.new @player, @z
			@pie_menu_painter = PieMenu.new

      @font = Gosu::Font.new 10
		end

		def draw
			@inventory_painter.draw
      @font.draw(@clock.report, 500,0,1024,4,4)
			draw_interactions
		end

		def click x, y
			if @player.hud_state.show_interactions?
				interaction = interactions_under(Point(x,y)).first
				@player.push_interaction(interaction) unless interaction == nil
			end
			return false
		end

		private

		def draw_interactions
			if @player.hud_state.show_interactions?
				@pie_menu_painter.draw self, @player.hud_state
			end
		end
	end
end