require "forwardable"

class Person
  def complete_name
    "alan toro"
  end
    
  def age
    33
  end
end

class SimpleContainer
  def initialize
    @person = Person.new
  end
end

sc = SimpleContainer.new
puts "SimpleContainer methods: " + (SimpleContainer.public_instance_methods(false) - Object.methods).join(" ")

class EnahncedContainer
  extend Forwardable  
  #def_delegator :@person, :complete_name, :my_name
  def_delegators :@person, :complete_name, :age
  
  def initialize
    @person = Person.new
  end     
end

ec = EnahncedContainer.new
puts "EnahncedContainer methods: " + (EnahncedContainer.public_instance_methods(false) - Object.methods).join(" ")
 
puts ec.complete_name
puts ec.age