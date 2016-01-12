require_relative "../initializer"

require_relative "../geography/world_map"

require_relative "../ui/iso_screen"

class IsoInitializer < Initializer

	register do |registry|
		puts "Initializing IsoView"

		registry.register_map :world, Geography::WorldMap.new
		registry.register_screen :world, UI::IsoScreen.new
	end

	associate do |registry|
		world = registry.map :world
		world.set_to_demo_world
	end
end