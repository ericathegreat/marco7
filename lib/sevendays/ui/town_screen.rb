require 'gosu'
require_relative '../registries/screen_registry'

module UI
	class TownScreen
		def initialize
			@image = Gosu::Image.new('img/Hong-Kong-Map.jpg')
		end

		def draw
			@image.draw(0,0,0)
		end

		def register
			Registries::ScreenRegistry.instance.register_screen 'Town', self
		end
	end
end
	