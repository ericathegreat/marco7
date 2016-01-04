module Geography
	class LockedCell < WorldCell
		def terrain_type= value
			puts 'Attempt to update locked cell failed'
		end
	end
end