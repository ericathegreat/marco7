require 'fiber'

module Actions
	class FollowPathAction
		def initialize(entity, path, speed = 0.5)  #speed = seconds per tile
			@entity = entity
			@path = path
			@ms_per_tile = speed * 1000
		end

		def start(time)
			return if @path.nil? || @path.size == 0
			
			@fiber = Fiber.new do

				@path.each do |current_target_wrapper|
					start_time = time
					percentage = 0.0

					current_origin = @entity.current_cell
					current_target = current_target_wrapper.location

					update_orientation(current_origin, current_target)

					until percentage >= 1.0 do
						time_diff = time - start_time #ms passed
						percentage = time_diff / @ms_per_tile

						@entity.move_to tween(current_origin, current_target, percentage)
						time = Fiber.yield
					end

					@entity.move_to [current_target.r, current_target.c]
					time = Fiber.yield
				end

				@entity.render_state[:switch] = nil
			end

			@fiber.resume
		end

		def finished?
			@fiber.nil? || !@fiber.alive?
		end

		def update(time)
			@fiber.resume time
		end

		def update_orientation (origin, target)
			if origin.r <= target.r && origin.c >= target.c
				@entity.render_state[:switch] = :walk_right
			else
				@entity.render_state[:switch] = :walk_left
			end
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