require 'gosu'
require_relative '../registry'

module UI
	class IsoScreen

		ROW_HEIGHT = 32
		COLUMN_WIDTH = 64

		def initialize
			@tiles = {}
			@tiles[:grass] = Gosu::Image.new('img/grass.png')
			@tiles[:water] = Gosu::Image.new('img/water.png')
			@tiles[:dirt] = Gosu::Image.new('img/dirt.png')
		end

		def associate
			@place = Registry.instance.map('World')
		end

		def draw #132 pixels wide
			(-1..20).each do |r|
				(-1..20).each do |c|
					draw_tile r,c
				end
			end
		end

		def draw_tile r, c
			terrain = @place.cell_at(r, c).terrain_type
			@tiles[terrain].draw( *world_to_screen(r,c) )
			# if (r+c).odd?
			# 	@tiles[terrain].draw(r*66, c*132, 0)
			# else
			# 	@tiles[terrain].draw(r*66, c*132 - 66, 0)
			# end
		end

		def screen_center_px
			return Player.instance.player_world_space
		end

		def render_top_left
			return Player.instance.player_world_space
		end

		def world_to_screen r_world, c_world
			r_px_render = (r_world + c_world) * ROW_HEIGHT
			c_px_render = (-c_world + r_world) * COLUMN_WIDTH

			r_origin, c_origin = render_top_left

			[c_px_render - c_origin + GameWindow::WINDOW_WIDE/2, 
				r_px_render - r_origin + GameWindow::WINDOW_HIGH/2, 
				r_world+c_world]
		end

		def screen_to_world r_px_screen, c_px_screen
			r_origin, c_origin = render_top_left
			c_px_render = c_px_screen + c_origin - GameWindow::WINDOW_WIDE/2
			r_px_render = r_px_screen + r_origin - GameWindow::WINDOW_HIGH/2

			# (-c + r) = c_px / COLUMN_WIDTH
			# (c + r) = r_px / ROW_HEIGHT
			r = ((c_px_render / COLUMN_WIDTH) + (r_px_render / ROW_HEIGHT)) / 2
			c = r_px_render / ROW_HEIGHT - r
			[r, c]
		end


		def key_hold id
			case(id)
				when Gosu::KbUp
					Player.instance.player_world_space_move [-4,0]
				when Gosu::KbDown
					Player.instance.player_world_space_move [4,0]
				when Gosu::KbLeft
					Player.instance.player_world_space_move [0, -4]
				when Gosu::KbRight
					Player.instance.player_world_space_move [0,4]
			end
		end

		def click x, y
			puts screen_to_world(y, x).inspect
			#r_origin, c_origin = Player.instance.player_world_space
			#Player.instance.player_world_space= [y - (GameWindow::WINDOW_WIDE/2) + r_origin, x - ( GameWindow::WINDOW_HIGH/2) + c_origin]
		end
	end
end