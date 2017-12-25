puts "#" * 100 

module Yellow
  def color
    "yellow"
  end
end 

module Green
  def color
    "green"
  end  
end

class A
  include Yellow
  
end

class B
  extend Green
  
end

puts "#" * 100
puts A.new.color
puts "#" * 100
puts B.color

class C
  
end

c = C.new

