require_relative "../initializer"

require_relative "../geography/world_map"
require_relative '../biomes/biome_mapper'
require_relative '../biomes/classical_temperate_biome'
require_relative '../biomes/lake_biome'
require_relative '../biomes/dirt_biome'
require_relative '../biomes/meadow_biome'
require_relative '../biomes/origin_biome'

require_relative "../ui/iso_screen"

class IsoInitializer < Initializer

	register do |registry|
		puts "Initializing IsoView"

		registry.register_map :world, Geography::WorldMap.new

		registry.register_biome :classical_temperate, Biomes::ClassicalTemperateBiome
		registry.register_biome :lake, Biomes::LakeBiome
		registry.register_biome :dirt, Biomes::DirtBiome
		registry.register_biome :meadow, Biomes::MeadowBiome
		registry.register_biome :origin, Biomes::OriginBiome

		registry.register_screen :world, UI::IsoScreen.new
	end

	associate do |registry|
		world = registry.map :world

		mapper = Biomes::BiomeMapper.new(250)

		puts "Generating new world..."
		mapper.build_world(world)
		#world.set_to_demo_world
	end
end