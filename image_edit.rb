require 'rmagick'

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
		@image_names = Dir["**/*.{JPG,jpg}"]
		puts @image_names
		change_img_size
	end 

	def change_img_size
		puts "What size do you want to resize your images to?"
		puts ">>"
		new_size = gets.chomp
		@image_names.resize_to_fit!(new_size)
		puts "Your images have been resized to #{new_size}."

	end 

	def change_img_name
		puts "what do you want to call this batch of images?"
		puts ">>"
		batch_name = gets.chomp
		img_num = 1



		# @image_names.each do |img_name|
		
		# 	new_name = if img_num < 10
				
		# 		"#{batch_name}_0#{img_num}.jpg"
			
		# 	else

		# 		"#{batch_name}_#{img_num}.jpg"

		# 	end 

		# 	puts new_name

		# 	File.rename img_name, new_name
		# 	img_num += 1
		# 	puts img_num

		# end 

	end 


end 


img_edit = ImageEdit.new 
img_edit.image_location