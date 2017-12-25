
def call(a, b, map, d = nil, e = nil)
  puts "#" * 100
  puts "a = #{a}"
  puts "b = #{b}"
  puts "map = #{map}"
  puts "d = #{d}"
  puts "e = #{e}"
  puts "#" * 100
end
  

call(1, 2, {})
call(1, 2, {}, nil, 42)
call(1, 2, {}, 142, 42)

m = Hash[:a => 'a', :b => 'b']
m[:c] = 'c'

call(1, 2, m)
call(1, 2, m, nil, 42)
call(1, 2, m, 142, 42)

