def f(data)
  puts ">> id: #{data.object_id}"
  data = data.sort_by { |e| e }
  puts ">> id: #{data.object_id}"
  
  puts ">>> " + data.inspect + " <<<"  
end

a = ['z', 'd', 'a']
puts "id1: #{a.object_id}"
puts a.inspect

f(a) 
puts a.inspect

# class My
  # attr_accessor :d
#       
  # def initialize
    # @d = ''
  # end
# end
# 
# 
# def f(i)
  # i.d = 'not empty'
# end
# 
# instance = My.new
# puts instance.inspect
# 
# f(instance)
# 
# puts instance.inspect

