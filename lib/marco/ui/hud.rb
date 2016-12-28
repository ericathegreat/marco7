require_relative '../player'
require_relative 'hud_manager'
require_relative 'pie_menu_view'
require_relative 'iso_space'
require_relative 'image_map'

module UI
	class Hud
		include IsoSpace

		def associate
			@player = Player.instance
		end

		def draw
			if(@player.hud_state.to_sym == :EntitySelected)
				HudManager.instance.add_view Registry.instance.view(:pie_menu)
			else
				HudManager.instance.remove_view Registry.instance.view(:pie_menu)
			end

			HudManager.instance.draw
		end

		def click x, y
			HudManager.instance.click x,y
			return false
		end
	end
end