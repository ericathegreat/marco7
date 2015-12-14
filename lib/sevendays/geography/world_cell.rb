module Geography
	class WorldCell

		def initialize params={}
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

	end
end