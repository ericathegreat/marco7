require_relative '../../registry'
require_relative 'base_sprite'
require 'Gosu'

module UI
	module Sprites
		class AnimationGroup

			def initialize sprites, duration
				@sprites = sprites
				@duration = duration
				@time_per_frame = @duration / sprites.size
			end

			def sprites
				@sprites
			end

			def draw layer, world_entity
				start_time = world_entity.render_state[:animation_start_time] ||= Gosu::milliseconds
				subseconds = Gosu::milliseconds
				current_frame = ((subseconds - start_time) / @time_per_frame) % @sprites.size
				@sprites[current_frame].draw layer, world_entity
			end

		end
	end
end