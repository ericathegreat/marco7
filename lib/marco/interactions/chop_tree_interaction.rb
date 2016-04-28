require_relative 'interaction_base'

module Interactions
	class ChopTreeInteraction < InteractionBase
		def initialize
		end

		def display_text
			'Chop Tree'
		end

		def execute player, entity
			player.find_path(entity.route_cell)
			entity.destroy
		end
	end
end