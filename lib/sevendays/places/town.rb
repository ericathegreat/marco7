require_relative 'place'
require_relative '../geography/world_map'

module Places
	class Town < Place
		def initialize
			super('Town')
		end

		def world_map
			@world_map ||= WorldMap.new
		end
	end
end