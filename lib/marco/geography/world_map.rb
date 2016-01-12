require_relative './world_cell'
require_relative './locked_cell'
require_relative './wall'

module Geography
	class WorldMap

		WORLD_SIZE = 1024

		#      r          c
		#      0          0
		#     0 1        1 0
		#    0 1 2      2 1 0
		#   0 1 2 3    3 2 1 0
		#  0 1 2 3 4  4 3 2 1 0
		#   1 2 3 4    4 3 2 1
		#    2 3 4      4 3 2
		#     3 4        4 3
		#      4          4

		def initialize rows = WORLD_SIZE, columns = WORLD_SIZE
			@out_of_bounds = LockedCell.new(self, -1, -1, terrain_type: :water)

			@wall_map = Hash.new
			@ground_map = Array.new(WORLD_SIZE) { Array.new(WORLD_SIZE) }
		end

		def set_to_demo_world
			cell_at(10,5).terrain_type = :dirt
			cell_at(10,6).terrain_type = :dirt
			cell_at(10,7).terrain_type = :dirt
			cell_at(3,3).terrain_type = :water
			cell_at(4,3).terrain_type = :water
			cell_at(5,3).terrain_type = :water
			cell_at(3,4).terrain_type = :water
			cell_at(4,4).terrain_type = :water
			cell_at(5,4).terrain_type = :water
		end

		def cell_at r, c
			return @out_of_bounds if (r < 0 || c < 0 || r >= WORLD_SIZE || c >= WORLD_SIZE)
			@ground_map[r][c] ||= WorldCell.new self, r, c
		end

		def can_walk r_precise, c_precise
			position_within_tile = [ r_precise.modulo(1), c_precise.modulo(1) ]
			position_of_tile = [ r_precise.floor, c_precise.floor ]
			return cell_at(*position_of_tile).can_walk( *position_within_tile )
		end

		def to_s
			"world #{world_size}"
		end
	end
end