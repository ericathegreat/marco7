module UI
	class AbstractDialog
		
		def initialize z = 4096
			@z = z
			@font = Gosu::Font.new 10
			@background = Registry.instance.sprite(:dialog_back)
			@button = Registry.instance.sprite(:white_button_border)
		end

		def with_frame(width, height)
				x = GameWindow::WINDOW_WIDE/2 - width/2
				y = GameWindow::WINDOW_HIGH/2 - height/2
				@background.screen_space_draw(x,y, width, height, @z)
				Gosu.translate(x, y) { yield }
		end

		def show
			HudManager.instance.add_view self
		end

		def hide
			HudManager.instance.remove_view self
		end

		def button
			# @click_map ||= 
		end

		def click x, y
			return true if @click_map.nil?
		end
	end
end