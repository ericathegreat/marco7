module UI
	class SpriteFamily
		def initialize sprites, extensions = []
			@sprites = sprites
			@extensions = extensions

			@current_frame = 0
		end

		def draw x_px, y_px, z, world_entity = nil
			@extensions.each do |e| 
				e.instance_method(:pre_draw).bind(self).call(world_entity)
			end

			@sprites[@current_frame].draw(x_px, y_px, z, world_entity)
		end
	end
end