require_relative '../../registry.rb'
require_relative 'base_sprite'
require 'Gosu'

module UI
	module Sprites
		class BorderSprite
			IMAGE_TYPES = [ :tl, :tr, :bl, :br, :left, :right, :top, :bottom, :background ]

			def initialize sprites
				@sprites = sprites
			end

			def sprites
				@sprites
			end

			def screen_space_draw left, top, width, height, z
				tl = sprites[:tl]
				tl.draw(left - tl.width, top - tl.height, z)
				tr = sprites[:tr]
				tr.draw(left + width, top - tl.height, z)
				br = sprites[:br]
				br.draw(left + width, top + height, z)
				bl = sprites[:bl]
				bl.draw(left - tr.width, top + height, z)

				l = sprites[:left]
				l.draw_as_quad(left - l.width, top, Gosu::Color::WHITE,
					left, top, Gosu::Color::WHITE,
					left, top + height, Gosu::Color::WHITE,
					left - l.width, top + height, Gosu::Color::WHITE,
					z) unless height <= 0

				r = sprites[:right]
				r.draw_as_quad( left + width, top, Gosu::Color::WHITE,
					left + width + r.width, top, Gosu::Color::WHITE,
					left + width + r.width, top + height, Gosu::Color::WHITE,
					left + width, top + height, Gosu::Color::WHITE,
					z) unless height <= 0

				t = sprites[:top]
				t.draw_as_quad(left, top - t.height, Gosu::Color::WHITE,
					left + width, top - t.height, Gosu::Color::WHITE,
					left + width, top, Gosu::Color::WHITE,
					left, top, Gosu::Color::WHITE,
					z) unless width <= 0

				b = sprites[:bottom]
				b.draw_as_quad(left, top + height, Gosu::Color::WHITE,
					left + width, top + height, Gosu::Color::WHITE,
					left + width, top + height + b.height, Gosu::Color::WHITE,
					left, top + height + b.height, Gosu::Color::WHITE,
					z) unless width <= 0

				bg = sprites[:background]
				bg.draw_as_quad( left, top, Gosu::Color::WHITE,
					left + width, top, Gosu::Color::WHITE,
					left + width, top + height, Gosu::Color::WHITE,
					left, top + height, Gosu::Color::WHITE,
					z) unless height <= 0 && width <= 0
			end
		end
	end
end