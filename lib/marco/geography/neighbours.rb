module Geography
	class Neighbours
		def initialize row, column, world = nil
			@r = row
			@c = column
			@world = world
			@data = []
			((@r-1)..(@r+1)).each do |r|
				((@c-1)..(@c+1)).each do |c|
					if !(r == @r && c == @c)
						@data << [r, c]
					end
				end
			end
		end

		def all
			@data
		end

		def select!
			@data.select! do |a|
				yield a
			end
		end

		def ensw
			@data.map do |cell|
				case cell
				when east
					'e'
				when north
					'n'
				when south
					's'
				when west
					'w'
				else
					''
				end
			end.sort.join
		end

		def select_by_type! terrain_type
			@data.select! do |coordinate| 
				type = @world.cell_at(*coordinate).terrain_type 
				type == terrain_type || type == :out_of_bounds
			end
			self
		end

		def cells
			@data.collect do |coordinate| 
				@world.cell_at(*coordinate)
			end
		end

		def west
			[@r-1, @c]
		end

		def east
			[@r+1, @c]
		end

		def south
			[@r, @c+1]
		end

		def north
			[@r, @c-1]
		end
	end
end