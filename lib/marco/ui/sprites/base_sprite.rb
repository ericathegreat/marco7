require_relative '../../registry.rb'
require 'Gosu'

module UI
	module Sprites
		class BaseSprite
			def initialize relative_filename, offset_x_px, offset_y_px, tileable = false
				@offset_x_px = offset_x_px
				@offset_y_px = offset_y_px
				@image = Gosu::Image.new("img/#{relative_filename}", tileable: tileable)
			end

			def draw x_px, y_px, z, world_entity = nil
				@image.draw(x_px - @offset_x_px, y_px - @offset_y_px, z)
			end
		end
	end
end