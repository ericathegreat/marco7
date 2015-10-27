module Interactions
	class TestInteraction
		def initialize (player, message)
			@player = player
			@message = message
		end

		def display_text
			@message
		end

		def execute
			puts @message
		end
	end
end