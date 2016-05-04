module Actions
	class FollowPathAction
		def initialize(entity, path, speed)  #speed = seconds per tile
			@entity = entity
			@path = path
			@ms_per_tile = speed * 1000
		end

		def start(time)
			@start_time = time
			@current_target = @entity.current_cell
			next_target (time)
		end

		def update(time)
			time_diff = time - @start_time #ms passed
			percentage = time_diff / @ms_per_tile

			if (percentage <= 1.0)
				@entity.move_to tween(@current_origin, @current_target, percentage)
			else
				next_target(time)
			end
		end

		def next_target time
			@current_origin = @current_target
			@current_target = @path.shift.location
			@start_time = time
		end

		def tween from, to, percentage
			from_a = from.r
			from_b = from.c
			to_a = to.r
			to_b = to.c
			[from_a + (to_a - from_a) * percentage,from_b + (to_b - from_b) * percentage]
		end
	end
end