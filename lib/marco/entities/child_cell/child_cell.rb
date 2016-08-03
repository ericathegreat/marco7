module Entities
	module ChildCell
		class ChildCell < SimpleDelegator
			def initializer parent
				super(parent)
			end

			def to_sym
					:child_cell
			end
		end
	end
end
