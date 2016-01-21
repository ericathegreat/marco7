require_relative "../initializer"
require_relative "../ui/sprites/base_sprite"
require_relative "../ui/hud"

class HudInitializer < Initializer
	register do |r|
		puts "Initializing Hud"

		r.register_sprite :inventory_item_back, UI::Sprites::BaseSprite.new('hud/metalPanel.png', 50, 50)
		r.register_screen :hud, UI::Hud.new
	end
end	