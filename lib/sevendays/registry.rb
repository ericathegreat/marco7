require 'singleton'

class Registry
	include Singleton

	['place', 'screen', 'map', 'sprite'].each do |thing|

		define_method "register_#{thing}" do |name, instance|
			send("#{thing}s")[name] = instance
			puts "Registered #{thing}: #{name}"
		end

		define_method "#{thing}" do |name|
			send("#{thing}s")[name]
		end

		define_method "#{thing}s" do
			ivar_name = "@#{thing}s"
			if(!instance_variable_defined?(ivar_name))
				instance_variable_set(ivar_name, Hash.new)
			end
			instance_variable_get(ivar_name)
		end

	end
end
