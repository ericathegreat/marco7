require_relative 'abstract_dialog'

module UI
	class BunkerDialog < AbstractDialog

		def initialize(bunker)
			super()
			@inventory_background = Registry.instance.sprite(:inventory_item_back)
			@player = Player.instance
			@bunker = bunker
		end

		def draw
			with_frame(800,500) do
				width = @font.text_width("Hello from Bunker")
				@font.draw("Hello from Bunker", 
					400-(width/2), 20, @z+1, 
					scale_x = 1, scale_y = 1,
					color = 0xff_000000) 

				draw_inventory_items

				button(100,450, 200, 24, 
					"Transfer Inventory", @z+1, 
					(@player.inventory.size > 0) ) do
					@bunker.inventory.concat(@player.inventory)
					@player.inventory.clear
				end

				button(500,450, 200, 24, "Cancel", @z+1) do
					self.hide
				end
			end
		end

		def draw_inventory_items
			if(@bunker.inventory.size == 0)
				width = @font.text_width("Stockpile Empty")
				@font.draw("Stockpile Empty", 
					200-(width/2), 200, @z+1, 
					scale_x = 1, scale_y = 1, 
					color = 0xff_666666) 
			else
				@bunker.inventory.each_with_index do |item, i|
					x = 10 + 90 * (i%4)
					y = 80 + 90 * (i/4)
					@inventory_background.screen_space_draw(x, y, 55, 55, @z)
					Registry.instance.inventory_sprite(item).screen_space_draw(x+45, y + 70, @z, 0.6)
				end
			end
		end
	end
end
