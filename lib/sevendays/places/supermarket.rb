require_relative 'place'
require_relative '../shop'
require_relative '../interactions/test_interaction'
require_relative '../product'
require_relative '../item'

module Places
	class Supermarket < Place
		include Shop

		def initialize
			super('Supermarket')
			stocks Product.new('Cheese', 1, Item)
			stocks Product.new('Yarn', 2.5, Item)
		end
	end
end