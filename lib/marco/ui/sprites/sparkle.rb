require_relative '../../registry'
require_relative '../base_sprite'
require 'Gosu'

module UI
	module Sprites
		module Sparkle
			def init_state
				world_entity.render_state[:sparkle_state] = 0
			end

			def pre_draw world_entity = nil
				subseconds = Gosu::milliseconds % 1000
				if(subseconds <= 20)
					world_entity.render_state[:sparkle_state] = Random.rand(@images.size)
				end
				@current_frame = world_entity.render_state[:sparkle_state] || 0
			end
		end
	end
end