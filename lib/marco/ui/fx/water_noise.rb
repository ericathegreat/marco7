require "ashton"
require_relative "../game_window"

module UI
	module FX
		class WaterNoise
  		NOISE_FRAGMENT =<<-END
#version 110

#include <noise2d>

uniform sampler2D in_Texture;
varying vec2 var_TexCoord;
uniform vec2 in_Topxy;
uniform vec2 in_WindowSize;

void main()
{
  gl_FragColor = texture2D(in_Texture, var_TexCoord);

  // Use [x, y] to create a 2D noise.
  vec2 position1 = vec2(((var_TexCoord) * in_WindowSize + in_Topxy));

  // general blotchy backgrop
  float brightness1 = snoise(position1 / 400.0) / 4.0 + 1.0;
	gl_FragColor.rgb *= brightness1;
}
  END

		  def self.shader topY, topX
		    @noise ||= Ashton::Shader.new fragment: NOISE_FRAGMENT, uniforms: {
	        window_size: [GameWindow::RENDER_WIDE, GameWindow::RENDER_HIGH]
	      }
		    @noise.topxy = [topX, topY]
		    @noise
		  end

		end
	end
end