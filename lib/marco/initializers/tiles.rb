require_relative "../initializer"
require_relative "../ui/iso_sprite"
require_relative "../ui/auto_connect_tile_sprite"

class Tiles < Initializer

	register do |registry|
		puts "Initializing Tiles"
		UI::IsoSprite.new :grass, offset_x_px: 64, offset_y_px: 32, image: Gosu::Image.new('img/grass.png', tileable: true)
		UI::IsoSprite.new :dirt, offset_x_px: 64, offset_y_px: 32, image: Gosu::Image.new('img/dirt.png', tileable: true)
		UI::IsoSprite.new :player, offset_x_px: 32, offset_y_px: 96, image: Gosu::Image.new('img/penguin.png')
		UI::IsoSprite.new :wall_basic, offset_x_px: 64, offset_y_px: 64, image: Gosu::Image.new('img/wall_basic.png', tileable: true)




		UI::AutoConnectTileSprite.new :water, offset_x_px: 64, offset_y_px: 32,
		 	o: Gosu::Image.new('img/water/o.png', tileable: true), 
		 	n: Gosu::Image.new('img/water/o.png', tileable: true), 
		 	en: Gosu::Image.new('img/water/en.png', tileable: true), 
		 	ns: Gosu::Image.new('img/water/o.png', tileable: true), 
		 	nw: Gosu::Image.new('img/water/nw.png', tileable: true), 
		 	ens: Gosu::Image.new('img/water/ens.png', tileable: true), 
		 	enw: Gosu::Image.new('img/water/enw.png', tileable: true), 
		 	nsw: Gosu::Image.new('img/water/nsw.png', tileable: true), 
		 	e: Gosu::Image.new('img/water/o.png', tileable: true), 
		 	es: Gosu::Image.new('img/water/es.png', tileable: true), 
		 	ew: Gosu::Image.new('img/water/o.png', tileable: true),
		 	esw: Gosu::Image.new('img/water/esw.png', tileable: true), 
		 	s: Gosu::Image.new('img/water/o.png', tileable: true), 
		 	sw: Gosu::Image.new('img/water/sw.png', tileable: true), 
		 	ensw: Gosu::Image.new('img/water/ensw.png', tileable: true) 
	end
end