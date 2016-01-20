require_relative 'neighbours'

module Geography
	class WorldCell

		BLOCKING_TERRAINS = [:water, :wall_basic, :out_of_bounds]
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

		def render_state
			@render_state ||= Hash.new
		end

		def row
			@r
		end

		def column
			@c
		end

		def state
			[@r, @c, @terrain_type]
		end

		def == (o)
			o.respond_to? state && o.state = state
		end
		
		alias_method :eql?, :==

		def hash
			state.hash
		end

		def neighbours
			return Neighbours.new(@r, @c, @world)
		end

		def can_walk r, c
			@can_walk ||= !BLOCKING_TERRAINS.include?(@terrain_type)
		end
	end
end