module MultiTile
	def create_footprint
		world = Registry.instance.map(:world)

		@multi_tile_child_cells = []
		footprint.each do |a, b|
			new_child = Entities::ChildCell::ChildCell.new(self)
			@multi_tile_child_cells << new_child
			world.cell_at(a+r, b+c).add_structure new_child
		end
	end

	def destroy_footprint
		world = Registry.instance.map(:world)
		@multi_tile_child_cells.each do |cell|
			world.cell_at(cell.r, cell.c).remove_structure(cell)
		end
		@multi_tile_child_cells.empty
	end
end