require_relative 'initialize'
require_relative 'marco/ui/game_window'
require_relative 'marco/registry'
require_relative 'marco/player'
require_relative 'marco/clock'

module Marco
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
