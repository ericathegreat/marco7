require_relative "../initializer"
require_relative "../ui/sprites/base_sprite"
require_relative "../ui/hud"
require "gosu"

class HudInitializer < Initializer
	register do |r|
		puts "Initializing Hud"

		r.register_sprite :inventory_item_back, UI::Sprites::BaseSprite.new('hud/metalPanel.png', 50, 50)
		r.register_sprite :pie_menu_background_left, Gosu::Image.new("img/hud/barHorizontal_blue_left.png", tileable: true)
		r.register_sprite :pie_menu_background_right, Gosu::Image.new("img/hud/barHorizontal_blue_right.png", tileable: true)
		r.register_sprite :pie_menu_background_mid, Gosu::Image.new("img/hud/barHorizontal_blue_mid.png", tileable: true)
		r.register_screen :hud, UI::Hud.new
	end
end	