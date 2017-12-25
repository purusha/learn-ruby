class K
  def salute
    puts "Aloha!"
  end
    
  def salute_with_log
    puts "Calling method..."
    salute_without_log
    puts "...Method called"
  end

  alias_method :salute_without_log, :salute
  alias_method :salute, :salute_with_log
end

k = K.new

#puts k.public_methods(false)
#puts "#" * 10

k.salute_without_log
puts "@" * 100

k.salute_with_log
puts "=" * 100

k.salute
puts "%" * 100
