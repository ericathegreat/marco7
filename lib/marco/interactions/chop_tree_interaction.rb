require_relative 'interaction_base'
require_relative '../actions/follow_path_action'

module Interactions
	class ChopTreeInteraction < InteractionBase

		def queue player, entity
			@fiber = Fiber.new do |time|
				path = player.find_path(entity.route_cell)
				wait_for_action Actions::FollowPathAction.new(player, path), time

				entity.destroy
				player.add_to_inventory(entity.harvest_chopped)
			end
		end

		def display_text
			'Chop Tree'
		end
	end
end