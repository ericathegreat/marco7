require_relative '../entities/classical_temperate/water_reeds'
require_relative 'simple_growth_biome'
	
module Biomes
	class DirtBiome < SimpleGrowthBiome
		def initialize(seed, x, y, world_map)
			super
			@likelyhood_of_growth = 0.5
			@terrain_type = :dirt
		end

		def decorate cell
		end
	end
end