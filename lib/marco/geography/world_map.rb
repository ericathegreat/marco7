require_relative './world_cell'
require_relative './locked_cell'
require_relative './wall'

module Geography
	class WorldMap

		WORLD_SIZE = 1024
		OUT_OF_BOUNDS = LockedCell.new(self, terrain_type: :water)
		WALL_WALK_PADDING = 0.4

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

		def initialize
			@wall_map = Hash.new
			@ground_map = Array.new(WORLD_SIZE) { Array.new(WORLD_SIZE) }
			cell_at(10,5).terrain_type = :dirt
			cell_at(10,6).terrain_type = :dirt
			cell_at(10,7).terrain_type = :dirt
			cell_at(3,3).terrain_type = :water
			cell_at(4,3).terrain_type = :water
			cell_at(5,3).terrain_type = :water
			cell_at(4,2).terrain_type = :water
			cell_at(4,4).terrain_type = :water
			wall_add(1,7,:north).wall_type = :wall_basic
			wall_add(2,7,:north).wall_type = :wall_basic
			wall_add(3,7,:west).wall_type = :wall_basic
			wall_add(3,7,:north).wall_type = :wall_basic
			wall_add(4,7,:west).wall_type = :wall_basic
			wall_add(3,8,:north).wall_type = :wall_basic
			wall_add(4,8,:west).wall_type = :wall_basic
			wall_add(4,9,:west).wall_type = :wall_basic
		end

		def cell_at r, c
			return OUT_OF_BOUNDS if (r < 0 || c < 0 || r >= WORLD_SIZE || c >= WORLD_SIZE)
			@ground_map[r][c] ||= WorldCell.new self
		end

		def wall_at r, c, direction
			return @wall_map["#{r},#{c},#{direction}"]
		end

		def walls_around r, c
			return [
				(@wall_map["#{r},#{c},north"] ? :north : nil),
				(@wall_map["#{r+1},#{c},west"] ? :east : nil),
				(@wall_map["#{r},#{c+1},north"] ? :south : nil),
				(@wall_map["#{r},#{c},west"] ? :west : nil)
			].compact
		end

		def can_walk r_precise, c_precise
			position_within_tile = [ r_precise.modulo(1), c_precise.modulo(1) ]
			position_of_tile = [ r_precise.floor, c_precise.floor ]
			return false unless cell_at(*position_of_tile).can_walk( *position_within_tile )

			surrounding_walls = walls_around(r_precise.floor, c_precise.floor)
			return false if surrounding_walls.include?(:north) && position_within_tile[0] <= WALL_WALK_PADDING
			return false if surrounding_walls.include?(:south) && position_within_tile[0] >=  (1-WALL_WALK_PADDING)
			return false if surrounding_walls.include?(:west) && position_within_tile[1] <= WALL_WALK_PADDING
			return false if surrounding_walls.include?(:east) && position_within_tile[1] <= (1-WALL_WALK_PADDING)
			true
		end

		def wall_add r,c,direction
			@wall_map["#{r},#{c},#{direction}"] = Wall.new
			wall_at r,c,direction
		end
	end
end