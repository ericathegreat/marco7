require_relative '../../interactions/view_bunker_interaction'
require_relative '../../world_space_aware'
require_relative '../../multi_tile'

module Entities
	module Bunker
		class Bunker
			include WorldSpaceAware
			include MultiTile

			def interactions
				[
					Interactions::ViewBunkerInteraction.new
				]
			end

			def to_sym
				:bunker
			end

			def footprint
				[[-1,0],[-1,-1],[0,-1]]
			end

			def route_cell
				Registry.instance.map(:world).cell_at(r-1, c)
			end
		end
	end
end