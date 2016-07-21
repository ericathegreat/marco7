require_relative "../initializer"
require_relative "../ui/sprites/base_sprite"
require_relative "../entities/bunker/bunker"

class BunkerInitializer < Initializer

	register do |r|
		puts "Initializing Bunker"

		r.register_sprite :bunker, UI::Sprites::BaseSprite.new('bunker.png', 48, 45)
		r.register_entity :bunker, Entities::Bunker::Bunker
	end
end	