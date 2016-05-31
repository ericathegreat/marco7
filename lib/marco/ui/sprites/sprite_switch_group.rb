require_relative 'base_sprite'
require 'Gosu'

module UI
	module Sprites
		class SpriteSwitchGroup

			def initialize state_table
				@states = state_table
			end

			def draw layer, world_entity
				render_state = world_entity.render_state[:switch] || @states.keys.first
				@states[render_state].draw(layer, world_entity)
			end
			
		end
	end
end