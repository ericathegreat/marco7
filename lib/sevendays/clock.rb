class Clock
	def initialize (hours_to_doomsday)
		@world_start_time  = 0 - (60 * hours_to_doomsday)
		@accelerated_time = 0
		@start_clock = Time.now.to_i

		@minutes_per_second = 1 #game speed
	end

	def time_now
		@world_start_time + @accelerated_time + (real_world_time_expired * @minutes_per_second)
	end

	def real_world_time_expired
		(Time.now.to_i - @start_clock)
	end

	def report
		now = time_now
		if (now < 0)
			"#{to_human_time(0-now)} until doomsday"
		else
			"#{to_human_time(now)} since doomsday"
		end
	end

	def to_human_time(minutes)
		"#{minutes} minutes"
	end

end