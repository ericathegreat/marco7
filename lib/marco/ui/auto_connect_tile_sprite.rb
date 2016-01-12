require_relative '../registry.rb'
require 'Gosu'

module UI
	class AutoConnectTileSprite
		TILE_TYPES = [ :o, :n, :en, :ns, :nw, :ens, :enw, :nsw, :e, :es, :ew, :esw, :s, :sw, :ensw ]

		def initialize label, params
			@offset_x_px = params[:offset_x_px] if params[:offset_x_px]
			@offset_y_px = params[:offset_y_px] if params[:offset_y_px]
			@tile_type = label

			@images = Hash[ TILE_TYPES.collect do |tile_type|
				[tile_type , params[tile_type]]
			end]

			Registry.instance.register_sprite(label, self)

			puts @images.inspect
		end

		def draw x_px, y_px, z, world_entity = nil
			if (nil != world_entity)
				neighbours = world_entity.neighbours.select_by_type!(@tile_type)
				draw_as = neighbours.ensw
				if draw_as == ""
					@images[:o].draw(x_px - @offset_x_px, y_px - @offset_y_px, z)
				else
					@images[draw_as.to_sym].draw(x_px - @offset_x_px, y_px - @offset_y_px, z)
				end
			else
				@images[:o].draw(x_px - @offset_x_px, y_px - @offset_y_px, z)
			end
		end

	end
end