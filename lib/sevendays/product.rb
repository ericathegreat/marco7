require_relative 'item'

class Product
	attr_reader :name, :price
	
	def initialize (name, price, item_class)
		@name = name
		@price = price
		@item_class = item_class
	end

	def item
		@item_class.new_from_product(self)
	end

	def interactions player
		Interactions::BuyProductInteraction.new(self, player)
	end
end