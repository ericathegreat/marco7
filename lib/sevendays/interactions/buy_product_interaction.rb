require_relative 'interaction_base'

module Interactions
	class BuyProductInteraction < InteractionBase
		def initialize (product)
			@product = product
		end

		def display_text player
			"Buy #{@product.name}"
		end

		def execute player
			if(player.can_afford @product.price)
				player.buy @product, @product.price
				puts "bought #{@product.name}"
			else
				puts "insufficient funds"
			end
		end
	end
end