require_relative "../initializer"
require_relative "../ui/base_sprite"
require_relative "../ui/sprite_factory"
require_relative "../ui/sprites/auto_connect_sprite_group"
require_relative "../ui/sprites/sparkle"

class Tiles < Initializer

	register do |r|
		puts "Initializing Tiles"

		r.register_sprite :player, UI::SpriteFactory.simple_sprite('penguin.png', 32, 64)
		# r.register_sprite :player, UI::SpriteFactory.simple_sprite('black_square.png', 1, 1)

		r.register_sprite :grass, UI::SpriteFactory.simple_sprite('grass.png', 64, 45, true)
		r.register_sprite :dirt, UI::SpriteFactory.simple_sprite('dirt.png', 64, 45, true)
		r.register_sprite :out_of_bounds, UI::SpriteFactory.simple_sprite('water/ensw.png', 64, 45, true)
		r.register_sprite :grass_blades, UI::SpriteFactory.simple_sprite('grass_blades.png', 64, 68)

		r.register_sprite :water, UI::SpriteFactory.auto_connect_sprite_group(:water, 'water/', 64, 45)
	end
end