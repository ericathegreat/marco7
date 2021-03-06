module UI
	class AbstractDialog
		
		def initialize z = 4096
			@z = z
			@font = Gosu::Font.new 20, name: "#{__dir__}/../../../font/Xolonium-Regular.ttf"
			@background = Registry.instance.sprite(:dialog_back)
			@button = Registry.instance.sprite(:white_button_border)

			@enabled_color = 0xff_000000
			@disabled_color = 0xff_999999

			@clickable = Hash.new
		end

		def with_frame(width, height)
				x = GameWindow::WINDOW_WIDE/2 - width/2
				y = GameWindow::WINDOW_HIGH/2 - height/2
				@background.screen_space_draw(x,y, width, height, @z)
				@frame_x = x
				@frame_y = y
				Gosu.translate(x, y) { yield }
		end

		def show
			HudManager.instance.add_view self
		end

		def hide
			HudManager.instance.remove_view self
		end

		def button (x, y, width, height, text, z, enabled=true, &block)
			@button.screen_space_draw(x, y, width, height, z)

			font_scale = 1
			text_width = @font.text_width(text, font_scale)

			font_color = ( enabled ? @enabled_color : @disabled_color )

			@font.draw(text, 
				x + width/2 - (text_width/2), y, z+1, 
				scale_x = font_scale, scale_y = font_scale, color = font_color) 
			zone = box_polygon(x,y,width,height)
			@clickable[zone] = block if enabled
		end

		def click x, y
			return true if @clickable.nil?
			point = Geometry::Point.new(x, y)
			@clickable.each do |box, method|
				if box.contains?(point)
					method.call
				end
			end
		end

		def box_polygon (x, y, w, h)
			x = x + @frame_x
			y = y + @frame_y
			Geometry::Polygon.new([
				Point(x, y),
				Point(x+w, y), 
				Point(x+w, y+h), 
				Point(x, y+h)])
		end

	end
end