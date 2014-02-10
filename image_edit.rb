class ImageEdit
	attr_accessor :location

	def initailize 
	end

	def image_location
		puts "Where are the images we're editing located."
		@location = gets.chomp 
		puts "the images are located: #{location}"
		get_imgs

	end 

	def get_imgs
		Dir.chdir("#{@location}")
		puts "Your directory is #{Dir.pwd}"
		image_names = Dir["**/*.{JPG,jpg}"]
		puts image_names
	end 


end 


img_edit = ImageEdit.new 
img_edit.image_location