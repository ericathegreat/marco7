require 'fiber'

module Interactions
	class InteractionBase
		def display_text
			self.class.name
		end

		def queue player, entity
			@fiber = interaction player, entity
		end

		def start(time)
			@fiber.resume time
		end

		def update(time)
			@fiber.resume(time) if @fiber.alive?
		end

		def finished?
			@fiber.nil? || !@fiber.alive?
		end

		def wait_for_action(action, time)
			action.start(time)
			until (action.finished?) do
				time = Fiber.yield
				action.update(time)
			end
		end
		
	end
end