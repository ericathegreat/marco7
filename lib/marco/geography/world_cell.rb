module Geography
	class WorldCell

		def initialize world, params={}
			@world = world
			@terrain_type = params[:terrain_type] || :grass
			@structures = []
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

		def can_walk r, c
			if @terrain_type == :water
				return false
			end
			true
		end
	end
end