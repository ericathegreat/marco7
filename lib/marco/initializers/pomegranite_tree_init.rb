require_relative "../initializer"
require_relative "../ui/sprites/base_sprite"
require_relative "../ui/sprites/sprite_switch_group"
require_relative "../entities/pomegranite_tree/pomegranite_tree"

class TilesInitializer < Initializer

	register do |r|
		puts "Initializing Pomegranite Tree"

		r.register_sprite :pomegranite_tree, UI::Sprites::SpriteSwitchGroup.new(
			empty: UI::Sprites::BaseSprite.new('pomegranite_tree.png', 56, 138),
			fruiting: UI::Sprites::BaseSprite.new('pomegranite_tree-fruiting.png', 56, 138)
		)
		r.register_entity :pomegranite_tree, Entities::PomegraniteTree::PomegraniteTree
		r.register_inventory_sprite :pomegranite, UI::Sprites::BaseSprite.new('pomegranite.png', 45, 75)
	end
end	