
def my_method(param = "default_value")
  puts "calling #{param}"
end

my_method("a")
my_method

puts "*" * 100

a = "123"

ss = <<-AAA
  CIAO IO SONO UNA STRINGA,
  DEFINITA ANCHE SU PIù RIGHE
  INDENTATA, CON %&$$ PARTICOLARI ...
  ED CON UN #{a} (PLACEHOLDER)
AAA

puts ss
puts "*" * 100

def call_me (*args)   
  puts "called with param [#{args.join(", ")}]"

  if block_given?
    for x in args
      yield x
    end
  else
    puts "avuluating nothing !!?"
  end
  
  puts "end ..."
end  

call_me

puts "*" * 100

call_me(1, 2, "tre") { |e|
  puts "evaluating element #{e}"
}

puts "*" * 100

