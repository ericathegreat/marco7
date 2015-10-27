module Interactions
	class ShowInventoryInteraction
		def initialize (player)
			@player = player
		end

		def display_text
			"Show Inventory (#{@player.inventory.size})"
		end

		def execute
			puts @player.inventory.inspect
		end
	end
end