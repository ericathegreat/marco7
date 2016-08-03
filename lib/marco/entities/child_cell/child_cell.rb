module Entities
	module ChildCell
		class ChildCell
			def initialize parent
				@parent = parent
			end

			def to_sym
					:child_cell
			end

			def create_footprint
			end

			def destroy_footprint
			end

			def method_missing(method, *args)
				@parent.send(method, *args)
			end
		end
	end
end
