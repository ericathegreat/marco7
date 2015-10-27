require_relative 'interaction_base'

module Interactions
	class MoveReturnInteraction < InteractionBase
		def display_text player
			"Return"
		end

		def execute player
			player.move_back
		end

		def valid? player
			player.can_return?
		end
	end
end