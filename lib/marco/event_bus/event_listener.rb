require_relative './event_bus'

module EventBus
	module EventListener
		def listen_to(event_type)
			EventBus.instance.listen_to(event_type, self)
		end
	end
end
