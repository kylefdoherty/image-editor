require 'optparse'

class OptionsParser #options parser class to parse commands (options) sent to program 	
	attr_reader :usage_message

	def initialize(options) #when an instance of OptionsParser is created it is passed the ARGV array meaning it gets all the things typed into the terminal 
		@parsed_out = {}
		@error = false
		optparse = OptionParser.new do |opts|
			opts.banner = "Usage: example.rb [options] --file1 --file2..."

			opts.on("-w", "--width WIDTH", Integer, "Provide a width that you want the image", "files resized to.") do |w|
    			@parsed_out[:width] = w
  			end #creates a -width option with required width.  the width is then set to the @parsed_out hash's key of :width

  			opts.on("-o", "--output OUTPUT", "Tell program where to put the resized images", "i.e. folder titled 'Facebook pics'.") do |o|
    			@parsed_out[:output] = o #does the same thing as width but for the output directory 
  			end
		end #calls .parse! on the entire thing and passes in options (the ARGV array).  It parses out the width and output and what is left in the ARGV array are the files 
			
		@usage_message = optparse.to_s


		begin 
			optparse.parse!(options)
		rescue OptionParser::InvalidOption => e
			@error = true
		end

		@input_files = options #the left over files are put into @input_files
	end 

	def width #method that returns the width value from the @parsed_out hash
		@parsed_out[:width]
	end

	def output #method that returns the output value from the @parsed_out hash
		@parsed_out[:output]
	end

	def input_files #method that returns the input files
		@input_files
	end 

	def valid
		not @error and required_options_supplied?
	end

	private
	def required_options_supplied?
		!!width and !!output
	end 
end 


