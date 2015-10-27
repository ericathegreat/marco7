require_relative 'interactions/buy_product_interaction'

module Shop

	def stocks (product)
		(@shop_products ||= []) << product
	end

	def interactions(player)
		buy = @shop_products.map do |product|
			Interactions::BuyProductInteraction.new(player, product)
		end
		return buy + super(player)
	end
end