require_relative 'interaction_base'

module Interactions
	class QuitInteraction < InteractionBase
		def display_text player
			'Quit'
		end

		def execute player
			player.quit
		end
	end
end