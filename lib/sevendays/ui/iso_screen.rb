require 'gosu'
require_relative '../registry'

module UI
	class IsoScreen
		def initialize
			@tiles = {}
			@tiles[:grass] = Gosu::Image.new('img/grass.png')
			@tiles[:water] = Gosu::Image.new('img/water.png')
		end

		def associate
			@place = Registry.instance.map('World')
		end

		def draw #132 pixels wide
			(-1..20).each do |r|
				(-1..20).each do |c|
					draw_tile r,c
				end
			end
		end

		def draw_tile r, c
			terrain = @place.cell_at(r, c).terrain_type
			@tiles[terrain].draw( *screen_space(r,c) )
			# if (r+c).odd?
			# 	@tiles[terrain].draw(r*66, c*132, 0)
			# else
			# 	@tiles[terrain].draw(r*66, c*132 - 66, 0)
			# end
		end

		def screen_space r, c
			row_height = 32
			column_width = 64
			r_px = (r + c) * row_height
			c_px = c * -column_width + r * (column_width)
			# c_px -= (column_width/2) if .odd?
			[c_px + 512, r_px, r+c]
		end
	end
end