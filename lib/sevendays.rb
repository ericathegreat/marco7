require 'highline/import'
require_relative "sevendays/version"
require_relative "sevendays/world"
require_relative "sevendays/player"
require 'set'

module Sevendays
	class Game
		def add_to_menu menu, interactions, player, submenu_prefix = ''
			merge_list = Set.new
			interactions.each do |interaction|
				display_text = interaction.display_text(player)
				if (display_text.start_with? submenu_prefix)
					display_text = display_text[submenu_prefix.length, display_text.length - submenu_prefix.length]
					if display_text.include?("//")
						display_text = display_text[0, display_text.index("//")]
						menu.choice(display_text + "...") {show_menu interactions, player, display_text + "//"} unless merge_list.include? display_text
						merge_list << display_text
					else
						menu.choice(display_text) {interaction.execute player}
					end
				end
			end
		end

		def show_menu (interactions, player, submenu_prefix = '')
			choose do |menu|
				add_to_menu menu, interactions, player, submenu_prefix
			end
		end

		def play
			world = World.generate
			player = Player.new world

			until player.quit? do
				interactions = player.location.interactions(player) + player.interactions(player)
				
				puts player.report
				
				show_menu interactions, player
				
			end
		end
	end

	Game.new.play
end
