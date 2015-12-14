require 'gosu'
require_relative '../registry'
require_relative 'town_screen'

module UI
  class GameWindow < Gosu::Window
  	WINDOW_WIDE = 1200
  	WINDOW_HIGH = 900

    def initialize world, player, clock
      super WINDOW_WIDE, WINDOW_HIGH
      @world = world
      @player = player
      @clock = clock

      @font = Gosu::Font.new 12
      self.caption = "Seven Days"
    end

    def update
      @interactions = @player.interactions(@player) +
          @player.location.contents.map{ |i| i.interactions(@player) }.flatten
    end

    def draw
      @screen = Registry.instance.screen 'World' #@player.location.name
      @screen.draw

      @font.draw(@player.location.name, 0,0,0,4,4)
      @font.draw(@clock.report, 300,0,0,4,4)
      @font.draw("$#{@player.money}", 930,0,0,4,4)
    end

    def needs_cursor?
      true
    end

    def button_up(id)
      @screen.click(mouse_x, mouse_y)
    end

  end
end