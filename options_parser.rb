class OptionsParser
	attr_accessor :width, :output, :input_files

	def initialize(options)
		pair_number = 0
		options.each_slice(2) do |pair|
			key = pair[0]
			value = pair[1]

			if key == ("--width")
				@width = value.to_i
			elsif key == ("--output") 
				@output = value
			else 
				break			
			end
			pair_number += 1
		end
		
		@input_files = options.drop(2*pair_number)
	end 


end 