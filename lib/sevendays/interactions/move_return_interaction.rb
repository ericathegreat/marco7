module Interactions
	class MoveReturnInteraction
		def initialize (player)
			@player = player
		end

		def display_text
			"Return"
		end

		def execute
			@player.move_back
		end
	end
end