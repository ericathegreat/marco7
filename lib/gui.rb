require_relative 'initialize'
require_relative 'sevendays/ui/game_window'
require_relative 'sevendays/registry'
require_relative 'sevendays/player'
require_relative 'sevendays/clock'

module Sevendays
	class Gui
		def run
			player = Player.instance
			clock = Clock.instance

			window = UI::GameWindow.new clock
			window.show
		end
	end

	Initialize.instance.run
	Gui.new.run
end
