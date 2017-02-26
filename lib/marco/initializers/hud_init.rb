require_relative "../initializer"
require_relative "../ui/sprites/base_sprite"
require_relative "../ui/sprites/border_sprite"
require_relative "../ui/hud"
require_relative "../ui/inventory"
require_relative "../ui/pie_menu_view"
require "gosu"

class HudInitializer < Initializer
	register do |r|
		puts "Initializing Hud"

		r.register_view :hud, UI::Hud.new
		r.register_view :pie_menu, UI::PieMenuView.new

		r.register_sprite :pie_menu_border, UI::Sprites::BorderSprite.new(
			tl: Gosu::Image.new("img/hud/barHorizontal_blue_left.png", tileable: true).subimage(0, 0, 6, 6), # l/t/w/h
			bl: Gosu::Image.new("img/hud/barHorizontal_blue_left.png", tileable: true).subimage(0, 20, 6, 6),
			tr: Gosu::Image.new("img/hud/barHorizontal_blue_right.png", tileable: true).subimage(0, 0, 6, 6),
			br: Gosu::Image.new("img/hud/barHorizontal_blue_right.png", tileable: true).subimage(0, 20, 6, 6),
			left: Gosu::Image.new("img/hud/barHorizontal_blue_left.png", tileable: true).subimage(0, 7, 6, 14),
			right: Gosu::Image.new("img/hud/barHorizontal_blue_right.png", tileable: true).subimage(0, 7, 6, 14),
			top: Gosu::Image.new("img/hud/barHorizontal_blue_mid.png", tileable: true).subimage(0, 0, 15, 6),
			bottom: Gosu::Image.new("img/hud/barHorizontal_blue_mid.png", tileable: true).subimage(0, 20, 15, 6),
			background: Gosu::Image.new("img/hud/barHorizontal_blue_mid.png", tileable: true).subimage(0, 7, 15, 12)
			)

		dialog_back = Gosu::Image.new("img/hud/metalPanel.png", tileable: true)
		r.register_sprite :dialog_back, UI::Sprites::BorderSprite.new(
			tl: dialog_back.subimage(0, 0, 10, 10), # l/t/w/h
			bl: dialog_back.subimage(0, 90, 10, 10),
			tr: dialog_back.subimage(90, 0, 10, 10),
			br: dialog_back.subimage(90, 90, 10, 10),
			left: dialog_back.subimage(0, 10, 10, 80),
			right: dialog_back.subimage(90, 10, 10, 80),
			top: dialog_back.subimage(10, 0, 80, 10),
			bottom: dialog_back.subimage(10, 90, 80, 10),
			background: dialog_back.subimage(10, 10, 80, 80)
			)

	end
end	