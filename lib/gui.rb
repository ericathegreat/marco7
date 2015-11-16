require_relative 'initializer'
require_relative 'sevendays/ui/game_window'
require_relative 'sevendays/registries/place_registry'
require_relative 'sevendays/player'
require_relative 'sevendays/clock'

module Sevendays
	class Gui
		def run
			town = Registries::PlaceRegistry.instance.for_name('Town')
			player = Player.new town
			clock = Clock.instance

			window = UI::GameWindow.new town, player, clock
			window.show
		end
	end

	Initializer.instance.run
	Gui.new.run
end
