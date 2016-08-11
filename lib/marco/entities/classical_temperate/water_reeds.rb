require_relative '../../interactions/test_interaction'
require_relative '../../world_space_aware'

module Entities
	module ClassicalTemperate
		class WaterReeds
			include WorldSpaceAware

			def interactions
				[
				]
			end

			def destroy
				Registry.instance.map(:world).cell_at(r, c).remove_structure self
			end

			def to_sym
				:water_reeds
			end
			
			def route_cell
				Registry.instance.map(:world).cell_at(r-1, c)
			end
		end
	end
end