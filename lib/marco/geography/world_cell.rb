require_relative 'cell_neighbourhood'

module Geography
	class WorldCell

		BLOCKING_TERRAINS = [:water, :wall_basic]
		def initialize world, r, c, params={}
			@world = world
			@terrain_type = params[:terrain_type] || :grass
			@structures = []

			@r = r
			@c = c
		end

		def to_s
			puts "[#{@r}, #{@c}] - #{@terrain_type}"
		end

		def structures
			@structures
		end

		def terrain_type
			@terrain_type
		end

		def terrain_type= value
			@terrain_type = value
		end

		def neighbours
			cells = []
			((@r-1)..(@r+1)).each do |r|
				((@c-1)..(@c+1)).each do |c|
					if !(r == @r && c == @c)
						cells << @world.cell_at(r, c)
					end
				end
			end
			cells
		end

		def neighbours_of_type terrain_type
			neighbours.select { |x| x.terrain_type == terrain_type}
		end

		def can_walk r, c
			return !BLOCKING_TERRAINS.include?(@terrain_type)
		end
	end
end