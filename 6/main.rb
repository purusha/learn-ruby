require 'a' 

class ToBe
  include MyModule    
  
  def prof
    puts "m1: " + respond_to?("m1").to_s
    puts "m2: " + respond_to?("m2").to_s
    
    m1
    m2    
  end  
end

ToBe.new.prof

class A
  
  def a
    b
  end
  
  private
  
  def b
    1 
  end
  
end

puts A.new.a
