require_relative 'simple_growth_biome'

module Biomes
	class ClassicalTemperateBiome < SimpleGrowthBiome
		def initialize(seed, x, y, world_map)
			super
			@likelyhood_of_growth = 0.6
			@terrain_type = :grass
			@tiles_per_run = 5
			@random = Random.new(seed)
		end

		def decorate cell
			r = @random.rand
			if r < 0.1
				cell.add_structure Entities::ClassicalTemperate::SmallPine.new
			elsif r > 0.95
				cell.add_structure Entities::ClassicalTemperate::PersimmonTree.new
			end
		end
	end
end