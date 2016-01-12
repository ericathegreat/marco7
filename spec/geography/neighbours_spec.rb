require 'rspec'
require_relative '../../lib/Marco/geography/neighbours'
require_relative '../../lib/Marco/geography/world_map'

module Geography
	describe Neighbours do
		it 'knows the 8 cells surrounding a point' do
			neighbourhood = Neighbours.new 5, 8
			expect(neighbourhood.all).to eq [
				[4,7],
				[4,8],
				[4,9],
				[5,7],
				[5,9],
				[6,7],
				[6,8],
				[6,9]
			]
		end

		describe 'the four cardinal directions' do
			it 'knows west' do
				expect(Neighbours.new(3,4).west).to eq [2,4]
			end
			it 'knows east' do
				expect(Neighbours.new(3,4).east).to eq [4,4]
			end
			it 'knows south' do
				expect(Neighbours.new(3,4).south).to eq [3,5]
			end
			it 'knows north' do
				expect(Neighbours.new(3,4).north).to eq [3,3]
			end

			describe 'can translate to a cardinal direction string' do
				it 'sorts directions correctly' do
					expect(Neighbours.new(3,4).ensw).to eq('ensw')
				end

				it 'only gets directions which exist' do
					neighbourhood = Neighbours.new(7,9)
					neighbourhood.select! { |cell| cell == neighbourhood.north || cell == neighbourhood.west }
					expect(neighbourhood.ensw).to eq 'nw'
				end
			end

			describe 'accessing terrain' do
				it 'can find matching terrain' do
					world = WorldMap.new 3, 3
					world.cell_at(0,0).terrain_type = :dirt
					world.cell_at(0,1).terrain_type = :dirt
					world.cell_at(0,2).terrain_type = :dirt
					world.cell_at(1,0).terrain_type = :dirt
					world.cell_at(1,1).terrain_type = :dirt #center
					world.cell_at(1,2).terrain_type = :dirt
					world.cell_at(2,0).terrain_type = :grass
					world.cell_at(2,1).terrain_type = :grass
					world.cell_at(2,2).terrain_type = :grass

					neighbourhood = Neighbours.new 1,1, world
					neighbourhood.select_by_type! :dirt
					expect(neighbourhood.all.size).to eq 5
				end
			end
		end


	end
end