class SayHello
  def hello
    return "hello !!'"
  end  
end

instance = SayHello.new
puts instance.hello 

sh = SayHello.new
def sh.ciao
  "ciao"
end

puts sh.hello
puts sh.ciao

#puts instance.ciao ---> undefined method `ciao' for #<SayHello:0x7f5cc009ab68> (NoMethodError)
