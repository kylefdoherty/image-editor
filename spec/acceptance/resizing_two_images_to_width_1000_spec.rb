require 'fileutils'
require 'rmagick'

describe 'ruby image_edit.rb' do 
	describe '--width 1000 --output  sandbox img1.jpg img2.jpg' do 
		before(:each) do
			if File.exists?("sandbox")
				FileUtils.rm_rf("sandbox")
			end
		end
		it 'should save img1.jpg in sandbox' do
			# 1. build up state / get system into know state
			
			# 2. execute program
			output = `ruby image_edit.rb --width "1000" --output sandbox spec/fixtures/img1.jpg spec/fixtures/img2.jpg`

			# 3. assert against state or output
			File.exists?("sandbox/img1.jpg").should == true
			File.exists?("sandbox/img2.jpg").should == true
		end
		
		it 'should resize img1.jpg to 1000px width' do 
			# 1. build up state

			# 2. execute program 
			output = `ruby image_edit.rb --width 1000 --output sandbox spec/fixtures/img1.jpg spec/fixtures/img2.jpg`

			# 3. assert against state or output
			img = Magick::Image::read('sandbox/img1.jpg').first
			img.columns.should == 1000
			img = Magick::Image::read('sandbox/img2.jpg').first
			img.columns.should == 1000

		end 
		it 'should resize img1.jpg to maintain aspect ratio' do 
			output = `ruby image_edit.rb --width 1000 --output sandbox spec/fixtures/img1.jpg`
			img = Magick::Image::read('sandbox/img1.jpg').first
			img.rows.should be_between 666, 667
		end 
	end 
	
end