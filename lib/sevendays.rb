require 'highline/import'
require_relative "sevendays/version"
require_relative "sevendays/player"
require_relative "sevendays/clock"
require_relative "initialize"
require 'set'

module Sevendays
	class Game
		def add_to_menu menu, interactions, submenu_prefix = ''
			merge_list = Set.new
			interactions.each do |interaction|
				display_text = interaction.display_text
				if (display_text.start_with? submenu_prefix)
					display_text = display_text[submenu_prefix.length, display_text.length - submenu_prefix.length]
					if display_text.include?("//")
						display_text = display_text[0, display_text.index("//")]
						menu.choice(display_text + "...") {show_menu interactions, display_text + "//"} unless merge_list.include? display_text
						merge_list << display_text
					else
						menu.choice(display_text) {interaction.execute}
					end
				end
			end
		end

		def show_menu (interactions, submenu_prefix = '')
			if !submenu_prefix.empty? 
				clear_screen
			end
			choose do |menu|
				add_to_menu menu, interactions, submenu_prefix
			end
		end

		def play
			Initialize.instance.run

			world = Registry.instance.place('Town')
			player = Player.new world
			clock = Clock.instance

			until player.quit? do
				interactions = player.interactions(player) +
					player.location.contents.map{ |i| i.interactions(player) }.flatten

				clear_screen				
				puts player.report
				puts clock.report
				
				show_menu interactions
			end
		end

		def clear_screen
			system('clear') or system('cls')
		end
	end

	Game.new.play
end
