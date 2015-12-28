require_relative 'interaction_base'

module Interactions
	class MoveReturnInteraction < InteractionBase
		def display_text
			"Return"
		end

		def execute
			@player.move_back
		end

		def valid?
			@player.can_return?
		end
	end
end