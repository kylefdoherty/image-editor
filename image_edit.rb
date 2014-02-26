require_relative 'options_parser.rb'
require_relative 'image_editor.rb'
require 'pp'

if $0 == __FILE__ # main method
	options = OptionsParser.new(ARGV) #creates a new instance of OptionsParser passing it the command line input with (ARGV)
	if options.valid
		editor = ImageEditor.new(options) #creates an instance of ImageEditor and passes it the instance of OptionsParser that has parssed the width, output directory, and what input files to use
		editor.run #runs the ImageEditor instance 
	else 
		puts options.usage_message
	end 
end