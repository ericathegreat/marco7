require 'singleton'

class Clock
	include Singleton

	INITIAL_MINUTES_TO_DOOMSDAY = (60*12)

	def initialize
		@world_start_time  = 0 - INITIAL_MINUTES_TO_DOOMSDAY
		@spent_time = 0
		@start_clock = Time.now.to_i

		@minutes_per_second = 0.5 #game speed
	end

	def time_now
		(@world_start_time + @spent_time + (real_world_time_expired * @minutes_per_second)).round
	end

	def spend_time minutes
		@spent_time += minutes
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