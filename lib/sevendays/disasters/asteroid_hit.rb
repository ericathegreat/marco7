require 'aspector'
require_relative '../registries/place_registry'

module Disasters
	class AsteroidHit < Aspector::Base
		before :arrive do
			puts "before"
		end

		def self.disaster
			puts "It's an asteroid hit!"
			supermarket = Registries::PlaceRegistry.instance.for_name('Supermarket')
			puts supermarket
			AsteroidHit.apply(supermarket)
		end
	end
end