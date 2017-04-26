class First
  def initialize(*args)
    puts "call on #{self} with #{args.inspect}"
  end
end

class Second < First
  def initialize(*args)
    super
    #super()
    puts "call on #{self} with #{args.inspect}"
  end  
end

Second.new("X", {:a => :b}, 1.234)

#[Note:    
#  super without arguments is a shortcut for passing the same arguments that were passed into the currently executing method. 
#  If you actually want to pass no arguments, you have to do so explicitly: super().
#]