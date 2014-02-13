require_relative 'options_parser.rb'
require_relative 'image_editor.rb'
require 'pp'

if $0 == __FILE__ # main method
	options = OptionsParser.new(ARGV)
	editor = ImageEditor.new(options)
	editor.run
end