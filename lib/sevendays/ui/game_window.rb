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
      @interactions = @player.interactions(@player) +
          @player.location.contents.map{ |i| i.interactions(@player) }.flatten
      button_hold
    end

    def draw
      @screen = Registry.instance.screen 'World' #@player.location.name
      @screen.draw

      @font.draw(@player.location.name, 0,0,1024,4,4)
      @font.draw(@clock.report, 300,0,1024,4,4)
      @font.draw("$#{@player.money}", 930,0,1024,4,4)
    end

    def needs_cursor?
      true
    end

    def button_up(id)
      @screen.click(mouse_x, mouse_y) if ((id == Gosu::MsLeft) && @screen.respond_to?(:click))
      @screen.key_up(id) if (@screen.respond_to? :key_up)
      @key_down_id = nil if (@key_down_id == id)
    end

    def button_down(id)
      @screen.key_down(id) if (@screen.respond_to? :key_down)
      @key_down_id = id if (@key_down_id == nil)
    end

    def button_hold
      if(@key_down_id != nil)
        @screen.key_hold(@key_down_id) if (@screen.respond_to? :key_hold)
      end
    end
  end
end