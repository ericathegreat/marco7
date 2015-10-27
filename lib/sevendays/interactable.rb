module Interactable
	def has_interaction interaction
		all_interactions << interaction
	end

	def interactions player
		all_interactions.select { |interaction| interaction.valid? player }
	end

	def all_interactions
		@all_interactions ||= []
	end

end