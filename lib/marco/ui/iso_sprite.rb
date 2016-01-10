require_relative '../registry.rb'
require 'Gosu'

module UI
	class IsoSprite
		def initialize label, params
			@offset_x_px = params[:offset_x_px] if params[:offset_x_px]
			@offset_y_px = params[:offset_y_px] if params[:offset_y_px]
			@image = params[:image]

			Registry.instance.register_sprite(label, self)
		end

		def draw x_px, y_px, z, world_entity = nil
			@image.draw(x_px - @offset_x_px, y_px - @offset_y_px, z)
		end

	end
end