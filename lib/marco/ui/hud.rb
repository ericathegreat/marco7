require_relative '../player'
require_relative '../clock'
require_relative 'inventory'
require_relative 'pie_menu_painter'
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
			@painters = {
				:EntitySelected => PieMenuPainter.new
			}

      @font = Gosu::Font.new 10
		end

		def draw
			@inventory_painter.draw
			draw_interactions
		end

		def hud_state_symbol
			@player.hud_state.class.name.split("::").last.to_sym
		end

		def click x, y
			if @player.hud_state.to_sym == :EntitySelected
				interaction = interactions_under(Point(x,y)).first
				@player.push_interaction(interaction) unless interaction == nil
			end
			return false
		end

		private

		def draw_interactions
			painter = @painters[@player.hud_state.to_sym]
			painter.draw(self, @player.hud_state) unless painter.nil?
		end
	end
end