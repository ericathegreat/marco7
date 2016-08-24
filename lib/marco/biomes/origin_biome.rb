require_relative '../entities/bunker/bunker'
require_relative 'simple_growth_biome'
	
module Biomes
	class OriginBiome < SimpleGrowthBiome
		def initialize(seed, x, y, world_map)
			super
			@likelyhood_of_growth = 0.3
			@terrain_type = :grass
			@world_map = world_map
			@origin = [x,y]
		end

		def install
			bunker_base = @world_map.cell_at(@origin[0] + @random.rand(-4..4), @origin[1] + @random.rand(-4..4))
			bunker_base.add_structure(Entities::Bunker::Bunker.new)
			bunker_base.terrain_type = :grass

			bunker_base.neighbours.cells.each {|c| c.terrain_type = :grass}
			
			@player_location = [bunker_base.r, bunker_base.c + 1]
			@world_map.cell_at(*@player_location).terrain_type = :grass
		end

		def complete
			Player.instance.move_to(@player_location)
		end

		def self.unique?
			true
		end
	end
end