require_relative './iso_sprite'
require_relative './iso_screen'

module UI
	class WallSprite < IsoSprite
		def draw x_px, y_px, z, orientation = :north
			if orientation == :north
				@image.draw_as_quad(
					x_px,  														y_px - @offset_y_px - IsoScreen::ROW_HEIGHT,	Gosu::Color::WHITE,
					x_px + IsoScreen::COLUMN_WIDTH,		y_px - @offset_y_px, 													Gosu::Color::WHITE,
					x_px + IsoScreen::COLUMN_WIDTH,		y_px, 																				Gosu::Color::WHITE,
					x_px, 														y_px - IsoScreen::ROW_HEIGHT, 								Gosu::Color::WHITE,
					z)
			else
				@image.draw_as_quad(
					x_px - IsoScreen::COLUMN_WIDTH,  	y_px - @offset_y_px,    											Gosu::Color::GRAY,
					x_px,														 	y_px - IsoScreen::ROW_HEIGHT - @offset_y_px, 	Gosu::Color::GRAY,
					x_px,								 						 	y_px - IsoScreen::ROW_HEIGHT,									Gosu::Color::GRAY,
					x_px - IsoScreen::COLUMN_WIDTH, 	y_px, 																				Gosu::Color::GRAY,
					z)
			end
		end
	end
end