require 'highline/import'
require_relative "sevendays/version"
require_relative "sevendays/world"
require_relative "sevendays/player"

module Sevendays
	world = World.generate
	player = Player.new world

	until player.quit? do
		puts player.report
		choose do |menu|
			menu.prompt = "Options:"
			player.location.interactions(player).each do |interaction|
				menu.choice(interaction.display_text player) {interaction.execute player}
			end

			player.interactions(player).each do |interaction|
				menu.choice(interaction.display_text player) {interaction.execute player}
			end
		end
		
	end
end
