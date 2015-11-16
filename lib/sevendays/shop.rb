require_relative 'interactions/buy_product_interaction'

module Shop
	def stocks (product)
		shop_products << product
	end

	def shop_products
		@shop_products ||= []
	end

	def interactions player
		shop_products.map do |product|
			Interactions::BuyProductInteraction.new(product, player)
		end
	end 

end