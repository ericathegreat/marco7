require 'gosu'
require_relative 'screens'

module UI
	class TownScreen
		def initialize
			@image = Gosu::Image.new('img/Hong-Kong-Map.jpg')
			Screens.instance.register_screen 'Town', self
		end

		def draw
			@image.draw(0,0,0)
		end
	end
end
	