require_relative '../../registry'
require_relative '../base_sprite'
require 'Gosu'

module UI
	module Sprites
		class SparkleSprite < BaseSprite
			def draw x_px, y_px, z, world_entity = nil
				@images[Random.rand(@images.size)].draw(x_px - @offset_x_px, y_px - @offset_y_px, z)
			end
		end
	end
end