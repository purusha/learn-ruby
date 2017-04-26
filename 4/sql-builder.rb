sql_select = <<-eo_sql_select
  SELECT table.name, %s, 
  FROM table LEFT JOIN temp_table_name ON %s
eo_sql_select

puts sql_select 
puts "*" * 100
puts sql_select % ["table.code", "a = 1"]
puts "*" * 100
puts sql_select % ["table.code", "a = 1", "NON SERVE MA LO AGGIUNGO"]
puts "*" * 100

puts "Y" if 1 > 0
puts "*" * 100
puts "N" unless 1 > 0
puts "*" * 100

puts "Y" if 1 < 0
puts "*" * 100
puts "N" unless 1 < 0
puts "*" * 100


