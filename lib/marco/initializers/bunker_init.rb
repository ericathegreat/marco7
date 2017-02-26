require_relative "../initializer"
require_relative "../ui/sprites/base_sprite"
require_relative "../entities/bunker/bunker"

class BunkerInitializer < Initializer

	register do |r|
		puts "Initializing Bunker"

		r.register_sprite :bunker, UI::Sprites::BaseSprite.new('bunker.png', 96, 124)
		r.register_entity :bunker, Entities::Bunker::Bunker

		r.register_sprite :white_button_border, UI::Sprites::BorderSprite.new(
			tl: Gosu::Image.new("img/hud/barHorizontal_white_left.png", tileable: true).subimage(0, 0, 6, 6), # l/t/w/h
			bl: Gosu::Image.new("img/hud/barHorizontal_white_left.png", tileable: true).subimage(0, 20, 6, 6),
			tr: Gosu::Image.new("img/hud/barHorizontal_white_right.png", tileable: true).subimage(0, 0, 6, 6),
			br: Gosu::Image.new("img/hud/barHorizontal_white_right.png", tileable: true).subimage(0, 20, 6, 6),
			left: Gosu::Image.new("img/hud/barHorizontal_white_left.png", tileable: true).subimage(0, 7, 6, 14),
			right: Gosu::Image.new("img/hud/barHorizontal_white_right.png", tileable: true).subimage(0, 7, 6, 14),
			top: Gosu::Image.new("img/hud/barHorizontal_white_mid.png", tileable: true).subimage(0, 0, 15, 6),
			bottom: Gosu::Image.new("img/hud/barHorizontal_white_mid.png", tileable: true).subimage(0, 20, 15, 6),
			background: Gosu::Image.new("img/hud/barHorizontal_white_mid.png", tileable: true).subimage(0, 7, 15, 12)
		)
	end
end	