class QuitInteraction
	def initialize (player)
		@player = player
	end

	def display_text
		'Quit'
	end

	def execute
		@player.quit
	end
end