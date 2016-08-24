module Biomes
	class BiomeMapper
		DEFAULT_STARTERS = 500

		def initialize(starters = DEFAULT_STARTERS, random = Random.new_seed)
			@random = Random.new(random)
			@regions = []
			@biome_starters = starters
		end

		def biome_types
			Registry.instance.biomes.values
		end

		def build_world(world_map)
			world_across = world_map.width
			world_down = world_map.height

			uniques = biome_types.select { |b| b.unique? }
			repeatable = biome_types.select { |b| !(b.unique?) }

			uniques.each do | biome_type |
				seed_biome(world_map, world_across, world_down, biome_type)
			end

			@biome_starters.times do
				biome_type = repeatable[@random.rand(repeatable.size)]
				seed_biome(world_map, world_across, world_down, biome_type)
			end

			grow_biomes
			complete_biomes
		end

		def seed_biome(world_map, world_across, world_down, biome_type)
			seed_x = @random.rand(world_across)
			seed_y = @random.rand(world_down)

			return if world_map.cell_at(seed_x, seed_y).terrain_type != :undefined
			
			new_biome = ( biome_type.new(@random.rand, seed_x, seed_y, world_map) )
			new_biome.install
			@regions << new_biome
		end

		def grow_biomes
			while !(@regions.index{ |r| r.active? }.nil?)
				@regions.each do |region|
					region.grow if region.active?
				end
			end
		end

		def complete_biomes
			@regions.each { |r| r.complete }
		end
	end
end