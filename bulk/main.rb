a = require 'mysql'
puts "load mysql module ? ... #{a}"

con = Mysql.new('localhost', 'root', 'root', 'bulk')

#puts "*" * 100
#puts con.public_methods.sort
#puts "*" * 100
  
#rs = con.query('select * from student')  
#rs.each_hash { |h| puts h['name']}

rs = con.query("LOAD DATA INFILE 'student.csv' INTO TABLE student FIELDS TERMINATED BY ','")
puts "rs is #{rs.nil? ? 'NIL' : rs}"
puts "affected_rows is #{con.affected_rows}"
puts "errno is #{con.errno}"
puts "error is #{con.error}"
puts "warning_count is #{con.warning_count}"

if con.warning_count
  con.query("SHOW WARNINGS").each { |e|
    error = e.to_a    
    puts "  Level = #{error[0]},  Code = #{error[1]},  Message = #{error[2]}"
    #puts e.public_methods
    #puts "*" * 100
  }
end

#rs = con.real_query("LOAD DATA INFILE 'student.csv' INTO TABLE student FIELDS TERMINATED BY ','")
#puts "rs is #{rs}"
#puts "affected_rows is #{con.affected_rows}"
#puts "errno is #{con.errno}"
#puts "error is #{con.error}"
#puts "warning_count is #{con.warning_count}"

con.close  
