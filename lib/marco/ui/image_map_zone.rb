module UI
	class Zone
		attr_accessor :interaction, :region
		def initialize region, interaction
			@region = region
			@interaction = interaction
		end
	end
end