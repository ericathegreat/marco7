require_relative 'place'
require_relative '../shop'
require_relative '../interactions/test_interaction'
require_relative '../product'

module Places
	class Supermarket < Place
		include Shop

		def initialize
			super('Supermarket')
			stocks Product.new('Cheese', 1)
			stocks Product.new('Yarn', 2.5)
		end
	end
end