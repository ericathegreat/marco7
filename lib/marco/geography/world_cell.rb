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
			"[#{@r}, #{@c}] - #{@terrain_type}"
		end

		def structures
			@structures
		end

		def add_structure s
			structures << s
			s.world_space= [@r, @c] if s.respond_to? :world_space=
			s.create_footprint if s.respond_to? :create_footprint
		end

		def remove_structure s
			structures.delete s
			s.world_space = [nil, nil] if s.respond_to? :world_space=
			s.destroy_footprint if s.respond_to? :remove_footprint
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

		def r
			@r
		end

		def c
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

		def can_walk
			@can_walk ||= !BLOCKING_TERRAINS.include?(@terrain_type)
			@can_walk && structures.empty?
		end

		#required for pathfinding
		def <=>(b)
	    if @r < b.r
	      -1
	    elsif @r > b.r
	      1
	    else
	      if @c < b.c
	        -1
	      elsif @c > b.c
	        1
	      else
	        0
	      end
	    end
	  end
	end
end