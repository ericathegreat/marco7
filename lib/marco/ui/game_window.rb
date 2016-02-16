require 'gosu'
require_relative '../registry'

module UI
  class GameWindow < Gosu::Window
  	WINDOW_WIDE = 1200
  	WINDOW_HIGH = 900

    def initialize clock
      super WINDOW_WIDE, WINDOW_HIGH
      @player = Player.instance
      @clock = clock

      @font = Gosu::Font.new 12
      @image = Gosu::Image.new('img/background.png', tileable: true)
      self.caption = "Marco 7"
    end

    def update
      @screen = Registry.instance.screen :world
      @screen.update
    end

    def draw
      @image.draw(0,0,0,WINDOW_WIDE, WINDOW_HIGH)
      @screen = Registry.instance.screen :world
      @screen.draw

      @hud = Registry.instance.screen :hud
      @hud.draw

      @font.draw(@clock.report, 500,0,1024,4,4)
      # @font.draw("$#{@player.money}", 930,0,1024,4,4)
    end

    def needs_cursor?
      true
    end

    def button_up(id)
      @screen.click(mouse_x, mouse_y) if ((id == Gosu::MsLeft) && @screen.respond_to?(:click))
    end
  end
end