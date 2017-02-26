require_relative "../initializer"
require_relative "../ui/sprites/base_sprite"
require_relative "../ui/sprites/border_sprite"
require_relative "../ui/hud"
require_relative "../ui/inventory"
require_relative "../ui/pie_menu_view"
require "gosu"

class HudInitializer < Initializer
	register do |r|
		puts "Initializing Inventory"

		r.register_view :inventory, UI::Inventory.new

		inventory_back = Gosu::Image.new("img/hud/glassPanel.png", tileable: true)
		r.register_sprite :inventory_item_back, UI::Sprites::BorderSprite.new(
			tl: inventory_back.subimage(0, 0, 10, 10), # l/t/w/h
			bl: inventory_back.subimage(0, 90, 10, 10),
			tr: inventory_back.subimage(90, 0, 10, 10),
			br: inventory_back.subimage(90, 90, 10, 10),
			left: inventory_back.subimage(0, 10, 10, 80),
			right: inventory_back.subimage(90, 10, 10, 80),
			top: inventory_back.subimage(10, 0, 80, 10),
			bottom: inventory_back.subimage(10, 90, 80, 10),
			background: inventory_back.subimage(10, 10, 80, 80)
			)
	end
end	