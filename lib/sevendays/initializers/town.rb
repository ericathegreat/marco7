require_relative "../../initializer"

require_relative "../places/town"
require_relative "../places/supermarket"
require_relative "../places/nursery"

require_relative "../ui/town_screen"

Initializer.instance.register do
	puts "Initializing Town"

	Places::Town.new.register
	Places::Supermarket.new.register
	Places::Nursery.new.register

	UI::TownScreen.new.register
end

Initializer.instance.associate do
	town = Registries::PlaceRegistry.instance.for_name('Town')
	supermarket = Registries::PlaceRegistry.instance.for_name('Supermarket')
	nursery = Registries::PlaceRegistry.instance.for_name('Garden Nursery')
	town.add_connected_location supermarket
	town.add_connected_location nursery
end