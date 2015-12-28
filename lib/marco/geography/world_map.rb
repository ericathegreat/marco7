require_relative './world_cell'
require_relative './wall'

module Geography
	class WorldMap

		WORLD_SIZE = 1024
		OUT_OF_BOUNDS = WorldCell.new(terrain_type: :water)

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

		def wall_add r,c,direction
			@wall_map["#{r},#{c},#{direction}"] = Wall.new
			wall_at r,c,direction
		end
	end
end