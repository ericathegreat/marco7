require 'gosu'
require 'geometry'
require_relative '../registries/registry'
require_relative 'image_map'

module UI
	class TownScreen
		include ImageMap

		def initialize
			@image = Gosu::Image.new('img/Hong-Kong-Map.jpg')
		end

		def associate
			@place = Registries::Registry.instance.place('Town')
			define_zone Geometry::Polygon.new([Point(0, 0), Point(100, 0), Point(100, 100), Point(0, 100)]), 
				@place.contents[1]
		end

		def draw
			@image.draw(0,0,0)
		end

		def register
			Registries::Registry.instance.register_screen 'Town', self
		end

	end
end
	