module Geography
	class Wall

		def initialize params={}
			@wall_type = params[:wall_type]
			@structures = []
		end

		def structures
			@structures
		end

		def wall_type
			@wall_type
		end

		def wall_type= value
			@wall_type = value
		end

	end
end