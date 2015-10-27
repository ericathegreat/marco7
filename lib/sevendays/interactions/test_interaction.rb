require_relative 'interaction_base'

module Interactions
	class TestInteraction < InteractionBase
		def initialize (message)
			@message = message
		end

		def display_text player
			@message
		end

		def execute player
			puts @message
		end
	end
end