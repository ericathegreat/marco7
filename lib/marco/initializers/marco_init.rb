require_relative "../initializer"
require_relative "../ui/sprites/base_sprite"
require_relative "../ui/sprites/sprite_switch_group"
require_relative "../ui/sprites/animation"


class TilesInitializer < Initializer

	def self.build_animation(height, width, images)
		sprites = images.map do |image|
			UI::Sprites::BaseSprite.new(image, height, width)
		end

		UI::Sprites::Animation.new(sprites, 1000)
	end

	register do |r|
		puts "Initializing Marco art"

		# marco_images = Gosu::Image.load_tiles("img/marco-walk.png", 118, 100, tileable: true)
		# marco_images = Gosu::Image.load_tiles("img/marco-idle-lookaround-000.png", 118, 100, tileable: true)

		r.register_sprite :player, UI::Sprites::SpriteSwitchGroup.new(
			idle: build_animation(64, 100, Gosu::Image.load_tiles("img/marco-idle-snapjaw-000.png", 118, 100, tileable: true)),
			walk_left: build_animation(64, 100, Gosu::Image.load_tiles("img/marco-walk-left.png", 118, 100, tileable: true)),
			walk_right: build_animation(64, 100, Gosu::Image.load_tiles("img/marco-walk-right.png", 118, 100, tileable: true))			
		)

		# r.register_sprite :player, UI::Sprites::Animation.new(marco_sprites,1000)
	end
end	