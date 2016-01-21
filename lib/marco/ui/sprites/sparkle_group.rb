require_relative '../../registry'
require_relative 'base_sprite'
require 'Gosu'

module UI
	module Sprites
		class SparkleGroup

			def initialize sprites
				@sprites = sprites
			end

			def sprites
				@sprites
			end

			def draw layer, world_entity
				subseconds = Gosu::milliseconds % 1000
				if(subseconds <= 20)
					world_entity.render_state[:sparkle_state] = Random.rand(@sprites.size)
				end
				current_frame = world_entity.render_state[:sparkle_state] || 0
				@sprites[current_frame].draw layer, world_entity
			end

		end
	end
end