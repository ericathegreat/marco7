require_relative "../initializer"

require_relative "../places/town"
require_relative "../places/supermarket"
require_relative "../places/nursery"

require_relative "../ui/town_screen"

class TownInitializer < Initializer

	register do
		puts "Initializing Town"

		Places::Town.new.register
		Places::Supermarket.new.register
		Places::Nursery.new.register

		# UI::TownScreen.new.register
	end

	associate do |registry|
		town = registry.place('Town')
		supermarket = registry.place('Supermarket')
		nursery = registry.place('Garden Nursery')
		town.add_connected_location supermarket
		town.add_connected_location nursery
	end
end