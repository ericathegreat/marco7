module Biomes
	class BiomeMapper
		DEFAULT_STARTERS = 500

		def initialize(starters = DEFAULT_STARTERS, random = Random.new_seed)
			@random = Random.new(random)
			@regions = []
			@starters = starters
		end

		def biome_types
			Registry.instance.biomes.values
		end

		def build_world(world_map)
			biome_starters = @starters
			world_across = world_map.width
			world_down = world_map.height

			biome_starters.times do
				seed_x = @random.rand(world_across)
				seed_y = @random.rand(world_down)

				biome_type_offset = @random.rand(biome_types.size)
				@regions << ( biome_types[biome_type_offset].new(@random.rand, seed_x, seed_y, world_map) )
			end

			while !(@regions.index{ |r| r.active? }.nil?)
				@regions.each do |region|
					region.grow if region.active?
				end
			end
		end

	end
end