require 'gosu'
require 'geometry'
require_relative '../registries/screen_registry'
require_relative 'image_map'

module UI
	class TownScreen
		include ImageMap

		def initialize
			@image = Gosu::Image.new('img/Hong-Kong-Map.jpg')
			define_zone Geometry::Polygon.new([Point(0, 0), Point(100, 0), Point(100, 100), Point(0, 100)]), 
				'place'
		end

		def draw
			@image.draw(0,0,0)
		end

		def register
			Registries::ScreenRegistry.instance.register_screen 'Town', self
		end

		def click(x,y)
			puts interactions_under(Point(x,y))
		end

	end
end
	