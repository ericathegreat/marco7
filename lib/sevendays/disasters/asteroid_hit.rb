require 'aspector'
require_relative '../registries/registry'

module Disasters
	class AsteroidHit < Aspector::Base
		before :arrive do
			puts "before"
		end

		def self.disaster
			puts "It's an asteroid hit!"
			supermarket = Registries::Registry.instance.place('Supermarket')
			puts supermarket
			AsteroidHit.apply(supermarket)
		end
	end
end