module HudStates
	class EntitySelected

		def initialize entities
			@entities = entities
		end

		def available_actions
			@interactions = @entities.each do |c|
				c.interactions
			end.flatten
		end

		def engaged_entity
			@entities.first
		end

		def to_sym
			:EntitySelected
		end

	end
end