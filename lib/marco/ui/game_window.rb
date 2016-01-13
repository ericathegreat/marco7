require 'gosu'
require_relative '../registry'
require_relative 'town_screen'

module UI
  class GameWindow < Gosu::Window
  	WINDOW_WIDE = 1200
  	WINDOW_HIGH = 900

    def initialize clock
      super WINDOW_WIDE, WINDOW_HIGH
      @player = Player.instance
      @clock = clock

      @font = Gosu::Font.new 12
      self.caption = "Seven Days"
    end

    def update
      @screen = Registry.instance.screen :world
      @screen.update
    end

    def draw
      @screen = Registry.instance.screen :world
      @screen.draw

      @font.draw(@clock.report, 300,0,1024,4,4)
      @font.draw("$#{@player.money}", 930,0,1024,4,4)
    end

    def needs_cursor?
      true
    end

    def button_up(id)
      @screen.click(mouse_x, mouse_y) if ((id == Gosu::MsLeft) && @screen.respond_to?(:click))
    end
  end
end