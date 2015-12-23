require_relative "../initializer"
require_relative "../ui/iso_sprite"
require_relative "../ui/wall_sprite"

class Tiles < Initializer

	register do |registry|
		puts "Initializing Tiles"
		UI::IsoSprite.new :grass, offset_x_px: 64, offset_y_px: 32, image: Gosu::Image.new('img/grass.png', tileable: true)
		UI::IsoSprite.new :water, offset_x_px: 64, offset_y_px: 16, image: Gosu::Image.new('img/water.png', tileable: true)
		UI::IsoSprite.new :dirt, offset_x_px: 64, offset_y_px: 32, image: Gosu::Image.new('img/dirt.png', tileable: true)
		UI::IsoSprite.new :player, offset_x_px: 32, offset_y_px: 64, image: Gosu::Image.new('img/penguin.png')
		UI::WallSprite.new :wall_basic, offset_y_px: 128, image: Gosu::Image.new('img/wall_basic.png', tileable: true)
	end
end