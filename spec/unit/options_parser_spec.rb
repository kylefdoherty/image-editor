require_relative "../../options_parser.rb"
require "pry"

describe OptionsParser do 
	describe ".new" do 
		it "converts an array of strings to a hash" do 
			options = ["--width", "1000", "--output", "sandbox", "img1.jpg", "img2.jpg", "img3.jpg"]
			o = OptionsParser.new(options)
			o.width.should == 1000
			o.output.should == "sandbox"
			o.input_files.should == ["img1.jpg", "img2.jpg", "img3.jpg"]
		end		
		it "converts another array of strings to a hash" do 
			options = ["--width", "1200", "img1.jpg", "img2.jpg", "img3.jpg", "img4.jpg"]
			o = OptionsParser.new(options)
			o.width.should == 1200
			o.output.should == nil
			o.input_files.should == ["img1.jpg", "img2.jpg", "img3.jpg", "img4.jpg"]
		end
	end
	describe '#valid?' do
		it "returns true if everything was supplied" do
			options = ["--output", "sandbox", "--width", "1200", "img1.jpg", "img2.jpg", "img3.jpg", "img4.jpg"]
			o = OptionsParser.new(options)

			o.valid.should == true
		end 
		it "checks that width present or valid" do
			options = ["--output", "sandbox", "img1.jpg", "img2.jpg", "img3.jpg"]
			o = OptionsParser.new(options)

			o.valid.should == false
		end 
		it "checks that output present or valid" do
			options = ["--width", "1200", "img1.jpg", "img2.jpg", "img3.jpg", "img4.jpg"]
			o = OptionsParser.new(options)

			o.valid.should == false
		end 

		it "check that the command (option) is valid" do 
			options = ["--blahblah"]
			o = OptionsParser.new(options)

			o.valid.should == false
		end 
	end

 		

end 