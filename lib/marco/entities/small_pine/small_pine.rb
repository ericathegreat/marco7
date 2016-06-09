require_relative '../../interactions/test_interaction'
require_relative '../../interactions/chop_tree_interaction'
require_relative '../../world_space_aware'

module Entities
	module SmallPine
		class SmallPine
			include WorldSpaceAware

			def interactions
				[
					Interactions::TestInteraction.new("Hello from small pine"),
					Interactions::ChopTreeInteraction.new,
				]
			end

			def destroy
				Registry.instance.map(:world).cell_at(r, c).remove_structure self
			end

			def harvest_chopped
				:pile_of_wood
			end

			def to_sym
				:small_pine
			end

			def route_cell
				Registry.instance.map(:world).cell_at(r-1, c)
			end
		end
	end
end