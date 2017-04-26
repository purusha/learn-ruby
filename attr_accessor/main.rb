class Dd
  
  attr_accessor :name
  attr_reader :a 
  attr_writer :b
  
  def initialize(name)
    @name = name
    @a = name.empty? ? '#' : name[0 .. 0]
  end
  
end

i = Dd.new("alan")

puts i.name
puts i.a

i.b = 10
i.name = "babbo natale"

p i

puts "il field 'b' non ha un getter ... x questo darà un errore:"
puts i.b
