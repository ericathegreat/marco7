require_relative '../entities/classical_temperate/water_reeds'

module Biomes
	class SimpleGrowthBiome
		def initialize(seed, x, y, world_map)
			@random = Random.new(seed)
			@active_set = [world_map.cell_at(x,y)]
			@world_map = world_map

			@likelyhood_of_growth = 1.0
			@tiles_per_run = 1
			@terrain_type = :grass
		end

		def active?
			@active_set.size > 0
		end

		def grow
			return unless active?
			
			@tiles_per_run.times do
				return unless active?
				first = @active_set.shift

				next if first.terrain_type != :undefined

				if @random.rand > @likelyhood_of_growth
					@active_set << first
					next
				end

				if (first.terrain_type == :undefined)
					first.terrain_type = @terrain_type
					self.decorate(first)
					first.neighbours.cells.each do |neighbor|
						@active_set << neighbor if (neighbor.terrain_type == :undefined)
					end
				end
			end
		end
	end
end