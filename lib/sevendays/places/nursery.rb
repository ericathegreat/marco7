require_relative 'place'
require_relative '../shop'
require_relative '../product'

module Places
	class Nursery < Place
		include Shop

		def initialize
			super('Garden Nursery')
			stocks Product.new('Strawberry seedlings', 5)
			stocks Product.new('Apple Tree', 30)
			stocks Product.new('Garlic bulbs', 6.95)
		end
	end
end