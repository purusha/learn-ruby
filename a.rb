
b = 'B'

def preserve(a, b)
    a != nil && a.length > 0 ? a : b
end

puts "-" * 10
puts '> %s' % ["" || b]
puts '> %s' % [nil || b]

puts "-" * 10
puts '> %s' % [preserve("", b)]
puts '> %s' % [preserve(nil, b)]
