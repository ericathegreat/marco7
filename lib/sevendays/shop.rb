require_relative 'interactions/buy_product_interaction'


module Shop
	include Interactable

	def stocks (product)
		#(@shop_products ||= []) << product
		has_interaction Interactions::BuyProductInteraction.new(product)
	end
end