module Actions
	class FollowPathAction
		def initialize(entity, path, speed = 0.5)  #speed = seconds per tile
			@entity = entity
			@path = path
			@ms_per_tile = speed * 1000
		end

		def start(time)
			return if @path.nil? || @path.size == 0

			@start_time = time
			@current_target = @entity.current_cell
			next_target (time)
		end

		def finished?
			@path.nil? || @finished
		end

		def update_orientation
			if @current_origin.r <= @current_target.r && @current_origin.c >= @current_target.c
				@entity.render_state[:switch] = :walk_right
			else
				@entity.render_state[:switch] = :walk_left
			end
		end

		def update(time)
			time_diff = time - @start_time #ms passed
			percentage = time_diff / @ms_per_tile

			update_orientation

			if (percentage < 1.0)
				@entity.move_to tween(@current_origin, @current_target, percentage)
			elsif @path.size == 0
				@entity.move_to [@current_target.r, @current_target.c]
				@entity.render_state[:switch] = nil
				@finished = true
			else
				next_target(time) unless @path.size == 0
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