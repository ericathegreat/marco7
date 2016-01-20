require_relative "../initializer"
require_relative "../ui/sprites/base_sprite"
require_relative "../ui/sprite_factory"
require_relative "../ui/sprites/auto_connect_sprite_group"
require_relative "../ui/sprites/sparkle_group"

class Tiles < Initializer

	register do |r|
		puts "Initializing Tiles"

		r.register_sprite :player, UI::Sprites::BaseSprite.new('penguin.png', 32, 64)
		# r.register_sprite :player, UI::SpriteFactory.simple_sprite('black_square.png', 1, 1)

		r.register_sprite :grass, UI::Sprites::BaseSprite.new('grass.png', 64, 45, true)
		r.register_sprite :dirt, UI::Sprites::BaseSprite.new('dirt.png', 64, 45, true)
		r.register_sprite :out_of_bounds, UI::Sprites::BaseSprite.new('water/ensw.png', 64, 45, true)
		r.register_sprite :grass_blades, UI::Sprites::BaseSprite.new('grass_blades.png', 64, 68)



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