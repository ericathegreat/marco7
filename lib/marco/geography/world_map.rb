require_relative './world_cell'
require_relative './locked_cell'
require_relative './wall'

module Geography
	class WorldMap

		WORLD_SIZE = 512

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
			@out_of_bounds = LockedCell.new(self, -1, -1, terrain_type: :out_of_bounds)

			@wall_map = Hash.new
			@ground_map = Array.new(WORLD_SIZE) { Array.new(WORLD_SIZE) }
		end

		def width
			WORLD_SIZE
		end

		def height
			WORLD_SIZE
		end

		def set_to_demo_world
			cell_at(10,5).terrain_type = :dirt
			cell_at(10,6).terrain_type = :dirt
			cell_at(10,7).terrain_type = :dirt
			cell_at(2,5).terrain_type = :water
			cell_at(2,6).terrain_type = :water
			cell_at(3,2).terrain_type = :water
			cell_at(4,2).terrain_type = :water
			cell_at(3,3).terrain_type = :water
			cell_at(4,3).terrain_type = :water
			cell_at(5,3).terrain_type = :water
			cell_at(6,3).terrain_type = :water
			cell_at(3,4).terrain_type = :water
			cell_at(4,4).terrain_type = :water
			cell_at(5,4).terrain_type = :water
			cell_at(6,4).terrain_type = :water
			cell_at(3,5).terrain_type = :water
			cell_at(4,5).terrain_type = :water
			cell_at(5,5).terrain_type = :water
			cell_at(6,5).terrain_type = :water
			cell_at(3,6).terrain_type = :water
			cell_at(4,6).terrain_type = :water
			cell_at(5,6).terrain_type = :water
			cell_at(0,0).terrain_type = :water
			cell_at(1,8).terrain_type = :water
			cell_at(1,9).terrain_type = :water
			cell_at(2,9).terrain_type = :water
			cell_at(1,10).terrain_type = :water
			cell_at(2,10).terrain_type = :water
			(0..100).each { |i| cell_at(0,i).terrain_type = :water}
			(0..100).each { |i| cell_at(i,0).terrain_type = :water}
			cell_at(5,6).add_structure Entities::ClassicalTemperate::WaterReeds.new
			cell_at(4,6).add_structure Entities::ClassicalTemperate::WaterReeds.new
			cell_at(4,5).add_structure Entities::ClassicalTemperate::WaterReeds.new
			cell_at(6,4).add_structure Entities::ClassicalTemperate::WaterReeds.new

			# cell_at(12,11).structures << :grass_blades
			# cell_at(12,12).structures << :grass_blades
			# cell_at(13,11).structures << :grass_blades
			# cell_at(14,13).structures << :grass_blades
			# cell_at(10,6).structures << :grass_blades
			# cell_at(10,7).structures << :grass_blades
			cell_at(10,12).add_structure Entities::ClassicalTemperate::SmallPine.new
			cell_at(10,13).add_structure Entities::ClassicalTemperate::SmallPine.new
			cell_at(10,14).add_structure Entities::ClassicalTemperate::SmallPine.new
			cell_at(11,12).add_structure Entities::ClassicalTemperate::SmallPine.new
			cell_at(10,8).add_structure Entities::ClassicalTemperate::PersimmonTree.new
			cell_at(11,9).add_structure Entities::ClassicalTemperate::PersimmonTree.new
			cell_at(8,10).add_structure Entities::ClassicalTemperate::SmallPine.new
			cell_at(2,4).add_structure Entities::ClassicalTemperate::SmallPine.new

			cell_at(13,8).add_structure Entities::Bunker::Bunker.new
		end

		def cell_at r, c
			return @out_of_bounds if (r < 0 || c < 0 || r >= WORLD_SIZE || c >= WORLD_SIZE)
			@ground_map[r][c] ||= WorldCell.new self, r, c
		end

		def can_walk r_precise, c_precise
			# position_within_tile = [ r_precise.modulo(1), c_precise.modulo(1) ]
			position_of_tile = [ r_precise.round, c_precise.round ]
			return cell_at(*position_of_tile).can_walk
		end

		def to_s
			"world #{world_size}"
		end
	end
end