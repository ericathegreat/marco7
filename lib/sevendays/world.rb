require_relative "place"
require_relative "supermarket"
require_relative "nursery"

module World

	def self.generate
		@town = build_places
		@town
	end

	def self.build_places
		town_places = [
			'Hardware Store',
			'Carpark',
			'Camping Goods',
			'Book Shop',
			'Library',
			'Petrol Station',
			'Bus Stop',
			'Car Park',
			'Electronics Store',
			'Whitegoods Store',
			'Office Building',
			'Antiques Dealer',
			'Cooking Instruments',
			'Pharmacy',
			'Park',
			'Lake'
		]

		town = Place.new('Town')
		town.add_connected_location Supermarket.new
		town.add_connected_location Nursery.new

		town_places.each do |place_name|
			place = Place.new(place_name)
			town.add_connected_location place
		end

		return town
	end
end