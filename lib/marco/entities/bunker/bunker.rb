require_relative '../../interactions/test_interaction'
require_relative '../../interactions/chop_tree_interaction'
require_relative '../../world_space_aware'

module Entities
	module Bunker
		class Bunker
			include WorldSpaceAware

			def interactions
				[
					Interactions::TestInteraction.new("Do not click this button again")
				]
			end

			def to_sym
				:bunker
			end

			def route_cell
				Registry.instance.map(:world).cell_at(r-1, c)
			end
		end
	end
end