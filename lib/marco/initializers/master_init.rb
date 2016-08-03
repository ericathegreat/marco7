require_relative "../initializer"
require_relative "../ui/sprites/noop"
require_relative "../entities/child_cell/child_cell"

class MasterInitializer < Initializer

	register do |r|
		puts "Initializing Master Items"
   	r.register_entity :child_cell, Entities::ChildCell::ChildCell
		r.register_sprite :child_cell, UI::Sprites::Noop.new
	end
end	