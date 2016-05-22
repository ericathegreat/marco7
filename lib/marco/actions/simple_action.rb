module Actions
	class SimpleAction
		def initialize(entity, &block)  #speed = seconds per tile
			@entity = entity
			@block = block
			@finished = false
		end

		def start(time)
		end

		def finished?
			@finished
		end

		def update(time)
			@block.call(time)
			@finished = true
		end
	end
end