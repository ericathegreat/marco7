require_relative 'interactions/buy_product_interaction'

module Shop
	def stocks (product)
		shop_products << product
	end

	def shop_products
		@shop_products ||= []
	end

	def contents
		@shop_products
	end
end