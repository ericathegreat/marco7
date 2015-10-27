module Interactions
	class InteractionBase
		def valid? player
			true
		end

		def display_text player
			self.class.name
		end

		def execute player
			puts "#{self.class.name}"
		end
	end
end