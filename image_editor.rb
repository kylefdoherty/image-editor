require 'fileutils'
class ImageEditor
	def initialize(options)
		@options = options
	end
	def run
		@options.input_files
		FileUtils.mkdir(@options.output)
		FileUtils.cp(@options.input_files, @options.output)
	end
end