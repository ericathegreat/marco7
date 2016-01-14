require_relative '../../registry.rb'
require 'Gosu'

module UI
	module Sprites
		class AutoConnectSpriteGroup
			TILE_TYPES = [ :o, :n, :en, :ns, :nw, :ens, :enw, :nsw, :e, :es, :ew, :esw, :s, :sw, :ensw ]

			def initialize label, params
				@tile_type = label

				@sprites = Hash[ TILE_TYPES.collect do |tile_type|
					[tile_type , params[tile_type]]
				end]
			end

			def draw x_px, y_px, z, world_entity = nil
				if (nil != world_entity)
					neighbours = world_entity.neighbours.select_by_type!(@tile_type)
					draw_as = neighbours.ensw
					if draw_as == ""
						@sprites[:o].draw(x_px, y_px, z, world_entity)
					else
						@sprites[draw_as.to_sym].draw(x_px, y_px, z, world_entity)
					end
				else
					@sprites[:o].draw(x_px, y_px, z, world_entity)
				end
			end

		end
	end
end