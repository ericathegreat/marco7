require 'highline/import'
require_relative "sevendays/version"
require_relative "sevendays/world"
require_relative "sevendays/player"

module Sevendays
	world = World.new.world
	player = Player.new world

	puts player.report

	choose do |menu|
		menu.prompt = "Options:"
		world.interactions(player).each do |interaction|
			menu.choice(interaction.display_text) {interaction.execute}
		end
	end
	
	puts player.report

end
