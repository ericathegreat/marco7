module Geography
	class CellNeighbourhood
		def initialize world, local_x, local_y
			@world = world
			@x = x
			@y = y
		end

		def neighbours
			cells = []
			((@x-1)..(@x+1)).each do |x|
				((@y-1)..(@y+1)).each do |y|
					if (@x != 0 && @y != 0)
						cells << @world.cell_at(x, y)
					end
				end
			end
			cells
		end

		def neighbours_of_type terrain_type
			neighbours.select { |x| x.terrain_type == terrain_type}
		end
	end
end