require_relative "../initializer"
require_relative "../ui/base_sprite"
require_relative "../ui/sprites/auto_connect_sprite_group"
require_relative "../ui/sprites/sparkle_sprite"

class Tiles < Initializer

	register do |registry|
		puts "Initializing Tiles"
		UI::BaseSprite.new :grass, offset_x_px: 64, offset_y_px: 32, images: [Gosu::Image.new('img/grass.png', tileable: true)]
		UI::BaseSprite.new :dirt, offset_x_px: 64, offset_y_px: 32, images: [Gosu::Image.new('img/dirt.png', tileable: true)]
		UI::BaseSprite.new :player, offset_x_px: 32, offset_y_px: 96, images: [Gosu::Image.new('img/penguin.png')]
		UI::BaseSprite.new :wall_basic, offset_x_px: 64, offset_y_px: 64, images: [Gosu::Image.new('img/wall_basic.png', tileable: true)]

		UI::Sprites::AutoConnectSpriteGroup.new :water,
		 	o: UI::BaseSprite.new( :anonymous, offset_x_px: 64, offset_y_px: 32, images: [Gosu::Image.new('img/water/o.png', tileable: true)]), 
		 	n: UI::BaseSprite.new( :anonymous, offset_x_px: 64, offset_y_px: 32, images: [Gosu::Image.new('img/water/o.png', tileable: true)]), 
		 	en: UI::BaseSprite.new( :anonymous, offset_x_px: 64, offset_y_px: 32, images: [Gosu::Image.new('img/water/en.png', tileable: true)]), 
		 	ns: UI::BaseSprite.new( :anonymous, offset_x_px: 64, offset_y_px: 32, images: [Gosu::Image.new('img/water/o.png', tileable: true)]), 
		 	nw: UI::BaseSprite.new( :anonymous, offset_x_px: 64, offset_y_px: 32, images: [Gosu::Image.new('img/water/nw.png', tileable: true)]), 
		 	ens: UI::BaseSprite.new( :anonymous, offset_x_px: 64, offset_y_px: 32, images: [Gosu::Image.new('img/water/ens.png', tileable: true)]), 
		 	enw: UI::BaseSprite.new( :anonymous, offset_x_px: 64, offset_y_px: 32, images: [Gosu::Image.new('img/water/enw.png', tileable: true)]), 
		 	nsw: UI::BaseSprite.new( :anonymous, offset_x_px: 64, offset_y_px: 32, images: [Gosu::Image.new('img/water/nsw.png', tileable: true)]), 
		 	e: UI::BaseSprite.new( :anonymous, offset_x_px: 64, offset_y_px: 32, images: [Gosu::Image.new('img/water/o.png', tileable: true)]), 
		 	es: UI::BaseSprite.new( :anonymous, offset_x_px: 64, offset_y_px: 32, images: [Gosu::Image.new('img/water/es.png', tileable: true)]), 
		 	ew: UI::BaseSprite.new( :anonymous, offset_x_px: 64, offset_y_px: 32, images: [Gosu::Image.new('img/water/o.png', tileable: true)]),
		 	esw: UI::BaseSprite.new( :anonymous, offset_x_px: 64, offset_y_px: 32, images: [Gosu::Image.new('img/water/esw.png', tileable: true)]), 
		 	s: UI::BaseSprite.new( :anonymous, offset_x_px: 64, offset_y_px: 32, images: [Gosu::Image.new('img/water/o.png', tileable: true)]), 
		 	sw: UI::BaseSprite.new( :anonymous, offset_x_px: 64, offset_y_px: 32, images: [Gosu::Image.new('img/water/sw.png', tileable: true)]), 
		 	ensw: UI::Sprites::SparkleSprite.new(:water_sparkle, offset_x_px: 64, offset_y_px: 32, images: [
		 			Gosu::Image.new('img/water/ensw.png', tileable: true),
		 			Gosu::Image.new('img/water/ensw-alt1.png', tileable: true),
		 			Gosu::Image.new('img/water/ensw-alt2.png', tileable: true),
		 			Gosu::Image.new('img/water/ensw-alt3.png', tileable: true),
		 	])
	end
end