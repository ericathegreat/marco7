require_relative '../registry.rb'
require 'Gosu'

module UI
	class BaseSprite
		def initialize params
			@offset_x_px = params[:offset_x_px] if params[:offset_x_px]
			@offset_y_px = params[:offset_y_px] if params[:offset_y_px]
			@image = params[:image]
		end

		def draw x_px, y_px, z, world_entity = nil
			@image.draw(x_px - @offset_x_px, y_px - @offset_y_px, z)
		end

	end
end