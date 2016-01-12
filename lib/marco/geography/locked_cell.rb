module Geography
	class LockedCell < WorldCell
		def terrain_type= value
			puts 'Attempt to update locked cell failed'
		end

		def neighbours
			return Neighbours.new(-1,-1, @world)
		end
	end
end