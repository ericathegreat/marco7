require 'singleton'
require 'weakref'

module EventBus
	class EventBus
		include Singleton

		def publish_event (event_type, event_data)
			listeners[event_type].each do |listener|
				listener.on_event(event_type, event_data)
			end unless listeners[event_type].nil?
		end

		def listen_to(event_type, listener)
			listeners[event_type] ||= []
			listeners[event_type] << WeakRef.new(listener)
		end

		private 

		def listeners
			@listeners ||= Hash.new
		end
	end
end