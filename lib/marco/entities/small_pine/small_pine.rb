require_relative '../../interactions/test_interaction.rb'

module Entities
	module SmallPine
		class SmallPine
			def interactions
				[
					Interactions::TestInteraction.new("Hello from small pine"),
					Interactions::TestInteraction.new("Still a small pine")
				]
			end

			def to_sym
				:small_pine
			end

		end
	end
end