a = Thread.new { 
  puts "a"; 
  sleep(10); 
  puts "b"; 
  puts "c" 
}

x = Thread.new { 
  puts "x"; 
  Thread.pass; 
  puts "y"; 
  puts "z" 
}
a.kill #this kill a thread  istantally
puts "before"
x.join # Let x thread finish, a will be killed on exit.
puts "after"