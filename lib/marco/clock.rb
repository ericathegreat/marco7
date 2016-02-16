require 'singleton'

class Clock
	include Singleton

	def initialize
		@world_start_time  = (7*60) #7 am, day 0
		@spent_time = 0
		@start_clock = Time.now.to_i

		@minutes_per_second = 1 #game speed
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
		to_human_time(now)
	end

	def to_human_time(minutes)
		days = (minutes/60/24).floor
		hours = (minutes - days*24*60) / 60
		minutes = (minutes - days*24*60 - hours*60)
		"Day #{minutes/60/24}, #{hours}:#{'%02d' % minutes}"
	end

end