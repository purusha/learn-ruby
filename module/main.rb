module A
  def self.included(base)
    puts ">> #{self} included in #{base}"
  end
     
  def self.extended(base)
    puts ">> #{self} extended in #{base}"
  end
  
  def foo
  end  
end

class B
  include A
end

begin
  B.foo
  puts "YES: B.foo"
rescue
  puts "No: B.foo"
end

begin
  B.new.foo
  puts "YES: B.new.foo"
rescue
  puts "No: B.new.foo"
end

puts "#" * 30

class C
  extend A
end


begin
  C.foo
  puts "YES: C.foo"
rescue
  puts "No: C.foo"
end

begin
  C.new.foo
  puts "YES: C.new.foo"
rescue
  puts "No: C.new.foo"
end
