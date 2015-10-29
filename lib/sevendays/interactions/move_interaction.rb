require_relative 'interaction_base'

module Interactions
	class MoveInteraction < InteractionBase
		def initialize (from, to)
			@from = from
			@to = to
		end

		def display_text player
			"Travel to//#{@to.name}"
		end

		def execute player
			if(player.location == @from)
				player.move_to @to
			end
		end
	end
end