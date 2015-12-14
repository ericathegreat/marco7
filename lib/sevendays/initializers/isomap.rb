require_relative "../initializer"

require_relative "../geography/world_map"

require_relative "../ui/iso_screen"

class IsoInitializer < Initializer

	register do |registry|
		puts "Initializing IsoView"

		registry.register_map 'World', Geography::WorldMap.new
		registry.register_screen 'World', UI::IsoScreen.new
	end

	associate do |registry|
		#nothing
	end
end