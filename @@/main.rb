class Xyz
  @@B = "variabile di classe ... condivisa tra tutte le istanze"
  BAR = "KOSTANTE"
  
  def initialize()
    @a = "instance variable" + rand(100).to_s
  end
  
end

puts Xyz.class_variable_defined?("@@B")
puts Xyz.class_variable_defined?("@@P")

i = Xyz.new
puts i.inspect

puts Xyz.class_eval("@@B")
puts Xyz.class_eval("BAR") == Xyz::BAR


class NumberOfInstance
  @@number = 0
  
  def initialize
    @@number += 1
    
    puts("Just created #{@@number} instance of #{self.class}.class")
  end
end

for i in 0..5
  NumberOfInstance.new
end