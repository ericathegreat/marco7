require_relative 'interaction_base'

module Interactions
	class TestInteraction < InteractionBase
		def initialize (message)
			@message = message
		end

		def display_text
			@message
		end

		def interaction player, entity
			Fiber.new do |time|
				puts @message
			end
		end
	end
end