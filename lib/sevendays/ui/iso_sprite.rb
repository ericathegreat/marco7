require_relative '../registry.rb'

module UI
	class IsoSprite
		def initialize label, params
			@type = params[:type]
			@offset_x_px = params[:offset_x_px]
			@offset_y_px = params[:offset_y_px]
			@image = params[:image]

			Registry.instance.register_sprite(label, self)
		end

		def draw x_px, y_px, z
			@image.draw(x_px - @offset_x_px, y_px - @offset_y_px, z)
		end
	end
end