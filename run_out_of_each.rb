a = [1, 2, 3]

a.each {|e|
  puts e
  
  if 2 == e
    break
  end
}
