require_relative "../initializer"

Initializer.instance.register do
	puts "Initializing Test"
end

Initializer.instance.associate do
	puts "Associating Test"
end
