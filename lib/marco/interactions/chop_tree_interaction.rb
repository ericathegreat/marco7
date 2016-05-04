require_relative 'interaction_base'
require_relative '../actions/follow_path_action'

module Interactions
	class ChopTreeInteraction < InteractionBase
		def initialize
		end

		def display_text
			'Chop Tree'
		end

		def execute player, entity
			path = player.find_path(entity.route_cell)
			player.start_action(Actions::FollowPathAction.new(player, path, 0.5))
			entity.destroy
		end
	end
end