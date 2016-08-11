require_relative "../initializer"
require_relative "../ui/sprites/base_sprite"
require_relative "../ui/sprites/sprite_switch_group"
require_relative "../entities/classical_temperate/persimmon_tree"
require_relative "../entities/classical_temperate/small_pine"
require_relative "../entities/classical_temperate/water_reeds"

class ClassicTemperateInitializer < Initializer

	register do |r|
		puts "Initializing Classic Temperate Plants"

		r.register_sprite :persimmon_tree, UI::Sprites::SpriteSwitchGroup.new(
			empty: UI::Sprites::BaseSprite.new('persimmon_tree.png', 56, 138),
			fruiting: UI::Sprites::BaseSprite.new('persimmon_tree-fruiting.png', 56, 138)
		)
		r.register_entity :persimmon_tree, Entities::ClassicalTemperate::PersimmonTree
		r.register_inventory_sprite :persimmon, UI::Sprites::BaseSprite.new('persimmon.png', 45, 75)

		r.register_sprite :small_pine, UI::Sprites::BaseSprite.new('pine_tree.png', 70, 230)
		r.register_entity :small_pine, Entities::ClassicalTemperate::SmallPine
		r.register_inventory_sprite :pile_of_wood, UI::Sprites::BaseSprite.new('pile_of_wood.png', 45, 65) 

		r.register_sprite :water_reeds, UI::Sprites::BaseSprite.new('water_reeds.png', 50, 170)
		r.register_entity :water_reeds, Entities::ClassicalTemperate::WaterReeds
	end
end	