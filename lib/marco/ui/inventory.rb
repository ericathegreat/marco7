module UI
	class Inventory
		
		def initialize player, z = 4096
			@player = player
			@inventory_background = Registry.instance.sprite(:inventory_item_back)
			@z = z
		end

		def draw
			@player.inventory_max_size.times do |i|
				x = 90 + 90*i
				y = GameWindow::WINDOW_HIGH - 80
				@inventory_background.screen_space_draw(x,y, 55, 55, @z)
				unless (@player.inventory[i].nil?)
					Registry.instance.inventory_sprite(@player.inventory[i]).screen_space_draw(x+45, y + 70, @z, 0.6)
				end
			end
		end
	end
end