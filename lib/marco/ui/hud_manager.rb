require "set"
require "singleton"
require_relative 'image_map'

module UI
	class HudManager
		include Singleton

		def initialize
			@all_views = Set.new
		end

		def add_view view
			@all_views.add(view)
		end

		def remove_view view
			@all_views.delete(view)
		end

		def draw
			@all_views.each { |v| v.draw }
		end

		def click x, y
			@all_views.each do |v| 
				v.click(x, y) if v.respond_to?(:click)
			end
		end
	end
end