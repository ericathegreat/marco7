require_relative "../initializer"
require_relative "../ui/sprites/base_sprite"
require_relative "../ui/sprites/animation_group"

class TilesInitializer < Initializer

	register do |r|
		puts "Initializing Marco"

		marco_images = Gosu::Image.load_tiles("img/marco-walk.png", 118, 100, tileable: true)
		puts "MARCO #{marco_images.size}"
		marco_sprites = marco_images.map do |image|
			UI::Sprites::BaseSprite.new(image, 64, 100)
		end


		r.register_sprite :player, UI::Sprites::AnimationGroup.new(marco_sprites,1000)
	end
end	