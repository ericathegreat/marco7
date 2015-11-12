require_relative 'sevendays/ui/game_window'
require_relative 'sevendays/world'
require_relative 'sevendays/player'
require_relative 'sevendays/clock'

module Sevendays
	class Gui
		def run
			world = World.generate
			player = Player.new world
			clock = Clock.instance

			window = UI::GameWindow.new world, player, clock
			window.show
		end
	end
	Gui.new.run
end
