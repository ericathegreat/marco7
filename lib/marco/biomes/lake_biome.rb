require_relative '../entities/classical_temperate/water_reeds'
require_relative 'simple_growth_biome'
require 'set'
	
module Biomes
	class LakeBiome < SimpleGrowthBiome
		def initialize(seed, x, y, world_map)
			super
			@likelyhood_of_growth = 0.4
			@terrain_type = :water
		end

		def decorate cell
			if @random.rand < 0.05
				cell.add_structure Entities::ClassicalTemperate::WaterReeds.new
			end
		end

		def complete
		end
	end
end