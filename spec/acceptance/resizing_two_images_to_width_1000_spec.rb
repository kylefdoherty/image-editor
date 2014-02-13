require 'fileutils'

describe 'ruby image_edit.rb' do 
	describe '--width 1000 --output  sandbox img1.jpg img2.jpg' do 
		it 'should save img1.jpg in sandbox' do
			# 1. build up state / get system into know state
			if File.exists?("sandbox")
				FileUtils.rm_rf("sandbox")
			end
			FileUtils.touch(["img1.jpg", "img2.jpg"])
			# 2. execute program
			output = `ruby image_edit.rb --width 1000 --output sandbox img1.jpg img2.jpg`

			# 3. assert against state or output
			File.exists?("sandbox/img1.jpg").should == true
		end
		# it 'should resize img1.jpg to 1000px width'
		# it 'should resize img1.jpg to 500px height'
	end 
	
end