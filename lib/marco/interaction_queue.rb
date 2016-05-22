class InteractionQueue

	def initialize player
		@player = player
		@queue = []
	end

	def update(time)
		if @queue.size > 0 || !@current.nil?

			if @current.nil? || @current.finished?
				start_next_action time
			else
				@current.update(time)
			end

		end
	end

	def start_next_action(time)
		@current = @queue.shift
		@current.start(time) unless @current.nil?
	end


	def << (interaction)
		@queue << interaction
		interaction.queue(@player, @player.hud_state.engaged_entity)
	end

end