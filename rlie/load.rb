#load 'test_library' #ERROR
load 'test_library.rb'

#puts "#{TestClass.public_methods.join(", \n").sort}"
puts "#{TestClass.class}"
puts "#{TestClass.new.class}"
