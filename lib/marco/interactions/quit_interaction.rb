require_relative 'interaction_base'

module Interactions
	class QuitInteraction < InteractionBase
		def display_text
			'Quit'
		end

		def execute
			@player.quit
		end
	end
end