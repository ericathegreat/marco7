require_relative "../initialize"

class Initializer

	def self.register &block
		Initialize.instance.register &block
	end

	def self.associate &block
		Initialize.instance.associate &block
	end
end
