module Geography
	class WorldPathAdapter

		TRAVEL_COST_DIAG = 14
		TRAVEL_COST_STRAIGHT = 10

		def initialize(world)
			@world = world
		end

		def blocked?(cell, unit_type)
			!(cell.can_walk)
		end

		def neighbors(cell)
			cell.neighbours.cells
		end

		def distance(from,to)
	    h_diagonal = [(from.r-to.r).abs, (from.c-to.c).abs].min
	    h_straight = ((from.r-to.r).abs + (from.c-to.c).abs)
	    return TRAVEL_COST_DIAG * h_diagonal + TRAVEL_COST_STRAIGHT * (h_straight - 2*h_diagonal)
	  end

	  def cost(from, to)
	    if from.r == to.r or from.c == to.c
	      if from.r == to.r and from.c == to.c
	        0
	      else
	        TRAVEL_COST_STRAIGHT
	      end
	    else
	      TRAVEL_COST_DIAG
	    end
	  end
	end
end