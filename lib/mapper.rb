require_relative 'marco/biomes/biome_mapper'
require_relative 'marco/biomes/classical_temperate_biome'
require_relative 'marco/biomes/lake_biome'
require_relative 'marco/biomes/dirt_biome'
require_relative 'marco/geography/world_map'

class Mapper
	def run
		map = Geography::WorldMap.new

		mapper = Biomes::BiomeMapper.new
		mapper.add_biome_type(Biomes::ClassicalTemperateBiome)
		mapper.add_biome_type(Biomes::LakeBiome)
		mapper.add_biome_type(Biomes::DirtBiome)

		puts mapper.biome_types

		mapper.build_world(map)

		map.height.times do |y|
			map.width.times do |x|
				print(map.cell_at(x,y).terrain_type.to_s[0])
			end
			puts
		end
	end

	Mapper.new.run
end
