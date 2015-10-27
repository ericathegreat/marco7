module Interactions
	class MoveInteraction
		def initialize (from, to, player)
			@from = from
			@to = to
			@player = player
		end

		def display_text
			"Move to #{@to.name}"
		end

		def execute
			if(@player.location == @from)
				@player.move_to @to
			end
		end
	end
end