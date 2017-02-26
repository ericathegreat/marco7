require_relative 'event_bus'

module EventBus
	module EventPublisher
		def publish_event(event_type, event_data)
			EventBus.instance.publish_event(event_type, event_data)
		end
	end
end
