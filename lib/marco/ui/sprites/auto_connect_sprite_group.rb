require_relative '../../registry.rb'
require_relative 'base_sprite'
require 'Gosu'

module UI
	module Sprites
		class AutoConnectSpriteGroup
			TILE_TYPES = [ :o, :n, :en, :ns, :nw, :ens, :enw, :nsw, :e, :es, :ew, :esw, :s, :sw, :ensw, :w ]

			def initialize link_to_terrain, sprites
				@sprites = sprites
				@tile_type = link_to_terrain
			end

			def self.smart_initialize name, relative_path, offset_x, offset_y
				UI::Sprites::AutoConnectSpriteGroup.new :water,
			 	o: BaseSprite.new("#{relative_path}o.png", offset_x, offset_y, true),
			 	n: BaseSprite.new("#{relative_path}o.png", offset_x, offset_y, true),
			 	en: BaseSprite.new("#{relative_path}en.png", offset_x, offset_y, true), 
			 	ns: BaseSprite.new("#{relative_path}o.png", offset_x, offset_y, true), 
			 	nw: BaseSprite.new("#{relative_path}nw.png", offset_x, offset_y, true),
			 	ens: BaseSprite.new("#{relative_path}ens.png", offset_x, offset_y, true), 
			 	enw: BaseSprite.new("#{relative_path}enw.png", offset_x, offset_y, true), 
			 	nsw: BaseSprite.new("#{relative_path}nsw.png", offset_x, offset_y, true), 
			 	e: BaseSprite.new("#{relative_path}o.png", offset_x, offset_y, true), 
			 	es: BaseSprite.new("#{relative_path}es.png", offset_x, offset_y, true), 
			 	ew: BaseSprite.new("#{relative_path}o.png", offset_x, offset_y, true),
			 	esw: BaseSprite.new("#{relative_path}esw.png", offset_x, offset_y, true), 
			 	s: BaseSprite.new("#{relative_path}o.png", offset_x, offset_y, true), 
			 	sw: BaseSprite.new("#{relative_path}sw.png", offset_x, offset_y, true), 
			 	ensw: BaseSprite.new("#{relative_path}ensw.png", offset_x, offset_y, true)
			end

			def sprites
				@sprites
			end

			def draw layer, world_entity
				if (nil != world_entity)
					neighbours = world_entity.neighbours.select_by_type!(@tile_type)
					draw_as = neighbours.ensw
					if draw_as == "" || @sprites[draw_as.to_sym].nil?
						@sprites[:o].draw(layer, world_entity)
					else
						@sprites[draw_as.to_sym].draw(layer, world_entity)
					end
				else
					@sprites[:o].draw(layer, world_entity)
				end
			end

		end
	end
end