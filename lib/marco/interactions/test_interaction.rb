require_relative 'interaction_base'

module Interactions
	class TestInteraction < InteractionBase
		def initialize (message)
			@message = message
		end

		def display_text
			@message
		end

		def execute player, entity
			puts @message
		end
	end
end