class Item
	attr_reader :name

	def initialize(name)
		@name = name
	end

	def self.new_from_product(product)
		@name = product.name
	end
end