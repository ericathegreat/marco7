require_relative 'interaction_base'

module Interactions
	class ShowInventoryInteraction < InteractionBase
		def display_text player
			"Show Inventory (#{player.inventory.size})"
		end

		def execute player
			system('clear') or system('cls')
			puts player.inventory.inspect
			gets
		end
	end
end