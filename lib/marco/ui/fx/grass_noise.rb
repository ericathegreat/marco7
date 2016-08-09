require "ashton"
require_relative "../game_window"

module UI
	module FX
		class GrassNoise
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
  
  // grass detail - strech the noise out in the y axis
  float brightness2 = snoise(position1 * vec2(1.0, 0.3) / 8.0) / 50.0 + 1.0;
  gl_FragColor.rgb *= brightness2;
}
  END

		  def self.shader topX, topY
		    @noise ||= Ashton::Shader.new fragment: NOISE_FRAGMENT, uniforms: {
	        window_size: [GameWindow::WINDOW_WIDE, GameWindow::WINDOW_HIGH]
	      }
		    @noise.topxy = [topY, topX]
		    @noise
		  end

		end
	end
end