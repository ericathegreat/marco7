require_relative 'place'
require_relative '../shop'
require_relative '../product'
require_relative '../item'

module Places
	class Nursery < Place
		include Shop

		def initialize
			super('Garden Nursery')
			stocks Product.new('Strawberry seedlings', 5, Item)
			stocks Product.new('Apple Tree', 30, Item)
			stocks Product.new('Garlic bulbs', 6.95, Item)
		end
	end
end