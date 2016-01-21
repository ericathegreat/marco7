require_relative '../player'
module UI
	class Hud

		def associate
			@player = Player.instance
			@z = 4096
			@inventory_background = Registry.instance.sprite(:inventory_item_back)
		end

		def draw
			draw_inventory
		end

		def draw_inventory
			@player.inventory_max_size.times do |i|
				@inventory_background.screen_space_draw(100 + 100*i,100, @z)
			end
		end
	end
end