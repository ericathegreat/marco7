require_relative '../../registry.rb'
require_relative '../iso_space.rb'
require 'Gosu'

module UI
	module Sprites
		class BaseSprite
			include IsoSpace
			def initialize relative_filename, offset_x_px, offset_y_px, tileable = false
				@offset_x_px = offset_x_px
				@offset_y_px = offset_y_px
				@image = Gosu::Image.new("img/#{relative_filename}", tileable: tileable)
			end

			def draw layer, world_entity
				screen_coords = world_to_screen(world_entity.r, world_entity.c, layer)
				@image.draw(screen_coords[0] - @offset_x_px, screen_coords[1] - @offset_y_px, screen_coords[2])
			end

			def screen_space_draw x, y, z
				@image.draw(x - @offset_x_px, y - @offset_y_px, z)
			end
		end
	end
end