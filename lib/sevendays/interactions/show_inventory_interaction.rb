require_relative 'interaction_base'

module Interactions
	class ShowInventoryInteraction < InteractionBase
		def display_text player
			"Show Inventory (#{player.inventory.size})"
		end

		def execute player
			puts player.inventory.inspect
		end
	end
end