require_relative 'interaction_base'
require_relative '../actions/follow_path_action'
require_relative '../ui/bunker_dialog'

module Interactions
	class ViewBunkerInteraction < InteractionBase

		def interaction player, entity
			Fiber.new do |time|
				# path = player.find_path(entity.route_cell)
				# wait_for_action Actions::FollowPathAction.new(player, path), time

				dialog = UI::BunkerDialog.new
				dialog.show
			end
		end

		def display_text
			'View'
		end
	end
end