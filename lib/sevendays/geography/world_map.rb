require_relative './world_cell'

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
			cell_at(10,5).terrain_type = :water
		end

		def cell_at r, c
			return OUT_OF_BOUNDS if (r < 0 || c < 0 || r >= WORLD_SIZE || c >= WORLD_SIZE)
			@ground_map[r][c] ||= WorldCell.new
		end

	end
end