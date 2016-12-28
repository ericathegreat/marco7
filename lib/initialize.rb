require 'singleton'
require_relative 'marco/registry'

class Initialize
	include Singleton

	def run
		puts "Initializing"
		
		Dir["#{File.dirname(__FILE__)}/Marco/initializers/*.rb"].each do |file| 
			puts "required #{file}"
			require file
		end

		@registrations.each { |r| r.call(Registry.instance) }
		# @associations.each { |a| puts "#{a}"; a.call(Registry.instance) }

		Registry.instance.views.values.each { |s| puts "Associating #{s}"; s.associate }

		generate_world
	end

	def register &block
		@registrations ||= Array.new
		@registrations << block
	end

	# def associate &block
	# 	@associations ||= Array.new
	# 	@associations << block
	# end


	def generate_world
		world = Registry.instance.map :world

		mapper = Biomes::BiomeMapper.new(250)

		puts "Generating new world..."
		mapper.build_world(world)
	end
end