require_relative 'image_map_zone'

module UI
	module ImageMap
		def define_zone polygon, interaction
			@zones ||= Array.new
			@zones << Zone.new(polygon, interaction)
		end

		def interactions_under point
			@zones.select{ |z| z.region.contains?(point) }.map(&:interaction).flatten
		end
	end
end