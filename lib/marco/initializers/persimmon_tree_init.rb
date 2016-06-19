require_relative "../initializer"
require_relative "../ui/sprites/base_sprite"
require_relative "../ui/sprites/sprite_switch_group"
require_relative "../entities/persimmon_tree/persimmon_tree"

class TilesInitializer < Initializer

	register do |r|
		puts "Initializing Persimmon Tree"

		r.register_sprite :persimmon_tree, UI::Sprites::SpriteSwitchGroup.new(
			empty: UI::Sprites::BaseSprite.new('persimmon_tree.png', 56, 138),
			fruiting: UI::Sprites::BaseSprite.new('persimmon_tree-fruiting.png', 56, 138)
		)
		r.register_entity :persimmon_tree, Entities::PersimmonTree::PersimmonTree
		r.register_inventory_sprite :persimmon, UI::Sprites::BaseSprite.new('persimmon.png', 45, 75)
	end
end	