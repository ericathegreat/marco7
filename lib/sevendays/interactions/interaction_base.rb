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

		def execute
			puts "#{self.class.name}"
		end
	end
end