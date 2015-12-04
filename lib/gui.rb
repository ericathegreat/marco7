require_relative 'initialize'
require_relative 'sevendays/ui/game_window'
require_relative 'sevendays/registry'
require_relative 'sevendays/player'
require_relative 'sevendays/clock'

module Sevendays
	class Gui
		def run
			town = Registry.instance.place('Town')
			player = Player.new town
			clock = Clock.instance

			window = UI::GameWindow.new town, player, clock
			window.show
		end
	end

	Initialize.instance.run
	Gui.new.run
end
