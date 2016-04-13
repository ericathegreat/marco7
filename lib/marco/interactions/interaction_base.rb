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

		def execute player, entity
			puts "#{self.class.name}"
		end
	end
end