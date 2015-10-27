module Interactions
	class BuyProductInteraction
		def initialize (player, product)
			@player = player
			@product = product
		end

		def display_text
			"Buy #{@product.name}"
		end

		def execute
			if(@player.can_afford @product.price)
				@player.buy @product, @product.price
				puts "bought #{@product.name}"
			else
				puts "insufficient funds"
			end
		end
	end
end