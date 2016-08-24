require_relative '../entities/classical_temperate/water_reeds'

module Biomes
	class SimpleGrowthBiome
		def initialize(seed, x, y, world_map)
			@random = Random.new(seed)
			@active_set = [world_map.cell_at(x,y)]
			@world_map = world_map
			@origin = [x, y]

			@likelyhood_of_growth = 1.0
			@tiles_per_run = 1
			@terrain_type = :grass
		end

		def self.unique?
			false
		end

		def active?
			@active_set.size > 0
		end

		def install
		end

		def grow
			return unless active?
			
			@tiles_per_run.times do
				return unless active?
				candidate = @active_set.shift

				next if candidate.terrain_type != :undefined

				if @random.rand > @likelyhood_of_growth
					@active_set << candidate
					next
				end

				if (candidate.terrain_type == :undefined)
					candidate.terrain_type = @terrain_type
					self.decorate(candidate)
					candidate.neighbours.cells.each do |neighbor|
						@active_set << neighbor if (neighbor.terrain_type == :undefined)
					end
				end
			end
		end

		def complete
		end

		def decorate cell
		end
	end
end