require 'Gosu'

module UI
	module Sprites
		class Noop
			def draw layer, world_entity
			end

			def screen_space_draw x, y, z, scale = 1
			end
		end
	end
end