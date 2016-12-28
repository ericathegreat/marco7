require_relative "pie_menu_painter"

module UI
	class PieMenuView
		def initialize
			@click_map = Object.new.extend(ImageMap)
		end

		def draw
			@painter.draw(@click_map)
		end

		def click x, y
			interaction = @click_map.interactions_under(Point(x,y)).first
			Player.instance.push_interaction(interaction) unless interaction == nil
		end

		def associate
			@painter = PieMenuPainter.new
		end
	end
end