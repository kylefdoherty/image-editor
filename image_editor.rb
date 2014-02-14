require 'fileutils'
require 'rmagick'

class ImageEditor
	def initialize(options)
		@options = options
	end
	def run
		FileUtils.mkdir(@options.output)
		resize 
	end

	def resize 
		@options.input_files.each do |file|
			img = Magick::Image::read(file)[0]
			img.resize_to_fit!(1000)
			output_path = File.join(@options.output, File.basename(file))
			img.write(output_path)
		end 
	end 
end