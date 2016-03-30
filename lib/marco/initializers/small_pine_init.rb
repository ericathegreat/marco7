require_relative "../initializer"
require_relative "../ui/sprites/base_sprite"
require_relative "../entities/small_pine/small_pine"

class TilesInitializer < Initializer

	register do |r|
		puts "Initializing Small Pine"

		r.register_sprite :small_pine, UI::Sprites::BaseSprite.new('pine_tree.png', 74, 195)
		r.register_entity :small_pine, Entities::SmallPine::SmallPine
	end
end	