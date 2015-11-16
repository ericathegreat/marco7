require_relative 'interaction_base'
require_relative '../clock'

module Interactions
	class MoveInteraction < InteractionBase
		def initialize (from, to, player)
			super player
			@from = from
			@to = to
		end

		def display_text
			"Travel to//#{@to.name}"
		end

		def execute
			if(@player.location == @from)
				@player.move_to @to
				Clock.instance.spend_time 60
			end
		end
	end
end