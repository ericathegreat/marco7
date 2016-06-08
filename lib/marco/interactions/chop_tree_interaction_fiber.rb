require_relative 'interaction_base'
require_relative '../actions/follow_path_action'
require_relative '../actions/simple_action'
require 'fiber'

module Interactions
	class ChopTreeInteractionFiber < InteractionBase
		def start(time)
			@fiber = Fiber.new do |time|
				@path = @player.find_path(@entity.route_cell)

				follow_path = Actions::FollowPathAction.new(@player, @path, 0.5)
				follow_path.start(time)
				until (follow_path.finished?) do
					time = Fiber.yield
					follow_path.update(time)
				end
				@entity.destroy
				@player.add_to_inventory(@entity.harvest_chopped)
			end

			@fiber.resume time
		end

		def finished?
			! @fiber.alive?
		end

		def update(time)
			@fiber.resume(time) if @fiber.alive?
		end

		def display_text
			'Chop Tree'
		end
	end
end