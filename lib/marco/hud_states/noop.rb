module HudStates
	class Noop
		
		def available_actions
			[]
		end

		def to_sym
			:Noop
		end

	end
end