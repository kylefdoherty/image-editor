require 'rmagick'

img = Magick::Image::read('images/Dog_sledding_2.14_01.jpg')[0]
puts img

# img.scale(0.3).write('Dog_sledding_2_modified2.jpg') {|i| i.quality = 90}



img.resize_to_fit!(1000)
img.write('resized_to_1000.jpg')

