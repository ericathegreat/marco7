module UI
	class Inventory
		
		def initialize z = 4096
			@z = z
		end

		def associate
			@inventory_background = Registry.instance.sprite(:inventory_item_back)
			HudManager.instance.add_view self
			@player = Player.instance
		end

		def draw
			Player.instance.inventory_max_size.times do |i|
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