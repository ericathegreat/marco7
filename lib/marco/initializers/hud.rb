require_relative "../initializer"
require_relative "../ui/sprites/base_sprite"

class Hud < Initializer

	register do |r|
		puts "Initializing Hud Artwork"

		r.register_sprite :inventory_item_back, UI::Sprites::BaseSprite.new('hud/metalPanel.png', 50, 50)
	end
end	