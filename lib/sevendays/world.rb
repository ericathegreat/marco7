require_relative "places/place"
require_relative "places/supermarket"
require_relative "places/nursery"

module World

	def self.generate
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

		town = Places::Place.new('Town')
		town.add_connected_location Places::Supermarket.new
		town.add_connected_location Places::Nursery.new

		town_places.each do |place_name|
			place = Places::Place.new(place_name)
			town.add_connected_location place
		end

		return town
	end
end