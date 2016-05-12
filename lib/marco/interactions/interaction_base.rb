module Interactions
	class InteractionBase
		def initialize player
			@player = player
		end
		
		def valid?
			true
		end

		def display_text
			self.class.name
		end

		def queue player, entity
			@player = player
			@entity = entity
			@finished = false
		end

		def actions
			@actions ||= []
		end

		def execute
			puts "#{self.class.name}"
		end

		def finished?
			@finished
		end

		def finish
			@finished = true
		end

		def update(time)
			if actions.empty?
				finish
			elsif actions.first.finished?
				actions.shift
				actions.first.start(time) if actions.size > 0
			else
				actions.first.update(time)
			end
		end
	end
end