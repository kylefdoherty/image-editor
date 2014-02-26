require 'fileutils'
require 'rmagick'

class ImageEditor
	def initialize(options)
		@options = options #sets @options to the instance of OptionsParser
	end
	def run
		FileUtils.mkdir(@options.output) #uses the FileUtils to make a directory called whatever was passed in with -o ex. -o facebook_pics
		resize 
	end

	def resize 
		@options.input_files.each do |file| #gets the input files from OptionsParser and loops through each of them
			img = Magick::Image::read(file)[0] #configures rmagick setting it to the img variable 
			img.resize_to_fit!(@options.width) #uses rmagick to resize the image to the size set by -w option
			output_path = File.join(@options.output, File.basename(file)) #sets the path for where to save (write) the resized images to by joining the output directory with the file basename
			img.write(output_path) #saves the resized files to the output_path
		end 
	end 
end