require_relative 'interaction_base'
require_relative '../actions/follow_path_action'
require_relative '../actions/simple_action'

module Interactions
	class ChopTreeInteraction < InteractionBase
		def initialize
		end

		def queue player, entity
			super player, entity
			@finished = false

			@path = player.find_path(entity.route_cell)

			@actions = [
				Actions::FollowPathAction.new(@player, @path, 0.5),
				Actions::SimpleAction.new(@tree) do |time|
					@entity.destroy
					@player.add_to_inventory(:small_pine)
				end
			]
		end

		def start(time)
			actions.first.start(time)
		end

		def display_text
			'Chop Tree'
		end
	end
end