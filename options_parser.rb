require 'optparse'
class OptionsParser
	

	def initialize(options)
		@parsed_out = {}
		OptionParser.new do |opts|
			opts.banner = "Usage: example.rb [options]"

			opts.on("-w", "--width WIDTH", Integer, "Change image width") do |w|
    			@parsed_out[:width] = w
  			end

  			opts.on("-o", "--output OUTPUT", "Set output directory") do |o|
    			@parsed_out[:output] = o
  			end
		end.parse!(options)
		@input_files = options
	end 

	def width
		@parsed_out[:width]
	end

	def output 
		@parsed_out[:output]
	end

	def input_files 
		@input_files
	end 
end 


