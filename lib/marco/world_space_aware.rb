module WorldSpaceAware
	def world_space= new_space
		@world_space_r = new_space[0]
		@world_space_c = new_space[1]
	end

	def world_space
		return @world_space_r, @world_space_c
	end

	def world_space_move relative
		@world_space_r += relative[0]
		@world_space_c += relative[1]
	end

	def r
		@world_space_r
	end

	def c
		@world_space_c
	end
end