require 'rspec'
require_relative '../../lib/Marco/geography/world_map'

module Geography
	describe WorldMap do

		context 'out of bounds' do
			it 'should have water in out of bounds areas' do
				expect(WorldMap::OUT_OF_BOUNDS.terrain_type).to eq :water
			end
		end

		context 'initialization' do
			before do
				@world = WorldMap.new
			end

			it 'should create a 1024x1024 grid of cells' do
				expect(@world.cell_at(1023,1023)).to be
			end

			it 'should return OUT_OF_BOUNDS object for < 0' do
				expect(@world.cell_at(-1,0)).to equal WorldMap::OUT_OF_BOUNDS
			end

			it 'should return OUT_OF_BOUNDS object for >= 1024' do
				expect(@world.cell_at(5,1024)).to equal WorldMap::OUT_OF_BOUNDS
			end
		end
	end
end
