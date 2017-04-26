require "my-module"

puts "exist Uno.method_one ? #{Uno.respond_to?("method_one")}";
puts "exist Uno.method_two ? #{Uno.respond_to?("method_two")}";
puts "exist Uno.method_2 ? #{Uno.respond_to?("method_2")}";
puts "-" * 50
puts "il require di un modulo rende disponibili i metodi di tipo 'module_function'"
puts "-" * 50

class MyClass
  include Uno
  
end

i = MyClass.new

puts "exist instance.method_one ? #{i.respond_to?("method_one")}";
puts "exist instance.method_two ? #{i.respond_to?("method_two")}";
puts "exist instance.method_2 ? #{i.respond_to?("method_2")}";
puts "-" * 50
puts "il mixin di un modulo NON rende disponibili i metodi di tipo 'module_function'"
puts "-" * 50

class MyColor    
  def a    
  end
  
  def self.b    
  end
  
  class << self
    def c      
    end
    
    def self.d #non si vede in nessun modo !!?            
    end
  end
end

puts "exist MyColor.a ? #{MyColor.respond_to?("a")}";
puts "exist MyColor.b ? #{MyColor.respond_to?("b")}";
puts "exist MyColor.c ? #{MyColor.respond_to?("c")}";
puts "exist MyColor.d ? #{MyColor.respond_to?("d")}";

y = MyColor.new
puts "exist y.a ? #{y.respond_to?("a")}";
puts "exist y.b ? #{y.respond_to?("b")}";
puts "exist y.c ? #{y.respond_to?("c")}";
puts "exist y.d ? #{y.respond_to?("d")}";

