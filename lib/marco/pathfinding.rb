require 'polaris'
require_relative 'geography/world_path_adapter'

class Pathfinding
	def initialize(world)
		@map_adapter = Geography::WorldPathAdapter.new(world)
	end

	def find_path from, to
		path = Polaris.new(@map_adapter).guide(from,to)
		if path.nil?
			puts "no path"
		end
		path
	end
end