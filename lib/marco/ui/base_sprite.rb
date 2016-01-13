require_relative '../registry.rb'
require 'Gosu'

module UI
	class BaseSprite
		ANONYMOUS = :anonymous

		def initialize label, params
			@offset_x_px = params[:offset_x_px] if params[:offset_x_px]
			@offset_y_px = params[:offset_y_px] if params[:offset_y_px]
			@images = params[:images]
			@extensions = params[:extensions] || []

			@current_frame = 0

			Registry.instance.register_sprite(label, self) unless label == BaseSprite::ANONYMOUS
		end

		def draw x_px, y_px, z, world_entity = nil
			@extensions.each do |e| 
				e.instance_method(:pre_draw).bind(self).call(world_entity)
			end
			@images[@current_frame].draw(x_px - @offset_x_px, y_px - @offset_y_px, z)
		end

	end
end