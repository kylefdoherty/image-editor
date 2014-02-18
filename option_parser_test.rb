require 'optparse'

options = {}

OptionParser.new do |opts|
  opts.banner = "Usage: example.rb [options]"

  opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
  
    options[:verbose] = v
  end

  opts.on("-w", "--width WIDTH", "Change image width") do |w|
 
    options[:width] = w
  end
end.parse!(ARGV)

p options
p ARGV