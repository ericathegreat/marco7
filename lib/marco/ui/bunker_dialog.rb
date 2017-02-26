require_relative 'abstract_dialog'

module UI
	class BunkerDialog < AbstractDialog
		def draw
			with_frame(800,500) do
				width = @font.text_width("Hello from Bunker")
				@font.draw("Hello from Bunker", 
					400-(width*2/2), 20, @z+1, 
					scale_x = 2, scale_y = 2, color = 0xff_000000) 
				@button.screen_space_draw(150,450, 200, 24, @z+1)
				@button.screen_space_draw(450,450, 200, 24, @z+1)
			end
		end
	end
end
