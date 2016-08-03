require_relative "../initializer"
require_relative "../ui/sprites/base_sprite"
require_relative "../ui/sprites/auto_connect_sprite_group"
require_relative "../ui/sprites/sparkle_group"

class TilesInitializer < Initializer

	register do |r|
		puts "Initializing Tiles"
		r.register_sprite :grass, UI::Sprites::BaseSprite.new('grass.png', 64, 32, true)
		r.register_sprite :dirt, UI::Sprites::BaseSprite.new('dirt.png', 64, 45, true)
		r.register_sprite :out_of_bounds, UI::Sprites::BaseSprite.new('water/ensw.png', 64, 45, true)
		r.register_sprite :grass_blades, UI::Sprites::BaseSprite.new('grass_blades.png', 64, 108)

		sparkle_water = UI::Sprites::SparkleGroup.new([
			UI::Sprites::BaseSprite.new('water/ensw.png', 64, 45, true),
			UI::Sprites::BaseSprite.new('water/ensw-alt1.png', 64, 45, true),
			UI::Sprites::BaseSprite.new('water/ensw-alt2.png', 64, 45, true),
			UI::Sprites::BaseSprite.new('water/ensw-alt3.png', 64, 45, true)
		])
		water_auto_sprite = UI::Sprites::AutoConnectSpriteGroup.smart_initialize(:water, 'water/', 64, 45)
		water_auto_sprite.sprites[:ensw] = sparkle_water

		r.register_sprite :water, water_auto_sprite
	end
end	