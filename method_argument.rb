def a(*args)
  args.last.is_a?(::Hash) ? args.pop : {}
end

puts ".) " + a.to_s
puts ".) " + a(1, 2).to_s
puts ".) " + a(1, 2, :a => "A").to_s
puts ".) " + a(1, 2, :a => "A", :b => "B").to_s

def b(*args)
  puts "#{args}"
end

b(1, 2, :a => "A", :b => "B")

def c(query, *params)
  puts("c ... #{query} && #{params}")
  
  puts query % params
  
  puts "#" * 100
end

c("SELECT DISTINCT(mailq_id), user_pk FROM MLR_TA_MAILQ q WHERE q.newsletter_id = %d AND q.delivery_id IN (%s) AND q.STATUS = 1", [1410459, 10460])


