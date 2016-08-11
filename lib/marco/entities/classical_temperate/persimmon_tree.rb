require_relative '../../interactions/test_interaction'
require_relative '../../interactions/chop_tree_interaction'
require_relative '../../world_space_aware'

module Entities
	module ClassicalTemperate
		class PersimmonTree
			include WorldSpaceAware

			def interactions
				[
					Interactions::ChopTreeInteraction.new,
				]
			end

			def destroy
				Registry.instance.map(:world).cell_at(r, c).remove_structure self
			end

			def to_sym
				:persimmon_tree
			end
			
			def harvest_chopped
				:persimmon
			end

			def route_cell
				Registry.instance.map(:world).cell_at(r-1, c)
			end
		end
	end
end