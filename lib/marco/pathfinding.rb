require 'polaris'
require_relative 'geography/world_path_adapter'

class Pathfinding
	def initialize(world)
		@map_adapter = Geography::WorldPathAdapter.new(world)
	end

	def find_path from, to
		puts "from: #{from}"
		puts "to: #{to}"
		path = Polaris.new(@map_adapter).guide(from,to)
		if path.nil?
			puts "no path"
		else
			path.each { |c| puts c.location.to_s }
		end
		path
	end
end