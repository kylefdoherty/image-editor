describe 'ruby image_edit.rb' do 
	describe '--width 1000 --output  sandbox img1.jpg img2.jpg' do 
		it 'should save img1.jpg in sandbox' do
			# 1. build up state
			# 2. execute program
			output = `ruby image_edit.rb --width 1000 --output sandbox img1.jpg img2.jpg`
			output.should == "Hello"
			# 3. assert against state or output
		end
		# it 'should resize img1.jpg to 1000px width'
		# it 'should resize img1.jpg to 500px height'
	end 
	
end