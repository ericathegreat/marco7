require_relative 'interaction_base'

module Interactions
	class ShowInventoryInteraction < InteractionBase
		def display_text
			"Show Inventory (#{@player.inventory.size})"
		end

		def execute player, entity
			system('clear') or system('cls')
			puts @player.inventory.inspect
			gets

		end
	end
end