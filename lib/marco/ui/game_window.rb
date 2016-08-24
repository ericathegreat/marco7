require 'gosu'
require_relative '../registry'

module UI
  class GameWindow < Gosu::Window
  	WINDOW_WIDE = 960
  	WINDOW_HIGH = 640
    SCALE = 0.05
    RENDER_WIDE = WINDOW_WIDE/SCALE
    RENDER_HIGH = WINDOW_HIGH/SCALE

    def initialize
      super WINDOW_WIDE, WINDOW_HIGH

      @player = Player.instance

      @image = Gosu::Image.new('img/background.png', tileable: true)
      self.caption = "Marco 7"
    end

    def update
      @screen = Registry.instance.screen :world
      @screen.update(Gosu.milliseconds)
    end

    def draw
      @image.draw(0,0,0,WINDOW_WIDE, WINDOW_HIGH)
      scale(SCALE, SCALE) do
        @screen = Registry.instance.screen :world
        @screen.draw self

      end

      @hud = Registry.instance.screen :hud
      @hud.draw
    end

    def needs_cursor?
      true
    end

    # def button_down(id)
    #   if (id == Gosu::MsLeft)
    #     consumed = @hud.mouse_down(mouse_x, mouse_y)
    #     @screen.mouse_down(mouse_x, mouse_y) if !consumed && @screen.respond_to?(:mouse_down)
    #   else
    #     @screen.button_down(id) if @screen.respond_to?(:button_down)
    #   end
    # end

    def button_up(id)
      if (id == Gosu::MsLeft)
        consumed = @hud.click(mouse_x, mouse_y)
        @screen.click(mouse_x, mouse_y) if !consumed && @screen.respond_to?(:click)
      else
        @screen.button_up(id) if @screen.respond_to?(:button_up)
      end
    end
  end
end