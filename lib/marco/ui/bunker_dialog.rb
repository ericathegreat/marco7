require_relative 'abstract_dialog'

module UI
	class BunkerDialog < AbstractDialog
		def draw
			with_frame(800,500) do
				width = @font.text_width("Hello from Bunker")
				@font.draw("Hello from Bunker", 
					400-(width*2/2), 20, @z+1, 
					scale_x = 2, scale_y = 2, color = 0xff_000000) 
				button(150, 450, 200, 24, "OK", @z+1) do
					puts "Button 1"
				end

				button(450,450, 200, 24, "Cancel", @z+1) do
					puts "Button 2"
					self.hide
				end
			end
		end
	end
end
