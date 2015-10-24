require_relative "place"

module World

	def self.generate
		@town = build_places
		@town
	end

	def self.build_places
		@places = {}
		town_places = [
			'Supermarket',
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
			'Garden Nursery',
			'Cooking Instruments',
			'Pharmacy',
			'Park',
			'Lake'
		]

		town = Place.new('Town')

		town_places.each do |place_name|
			place = Place.new(place_name)
			@places[place_name] = place

			town.add_connected_location place
		end

		return town
	end
end