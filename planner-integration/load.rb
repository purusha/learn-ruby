a = require 'mysql'
puts "load mysql module ? ... #{a}"

a = require 'profiler_helper'
puts "load profiler_helper module ? ... #{a}"

#a = load '/home/alan/NetBeansProjects/planner2/lib/contactlab.rb'
#puts "load contactlab lib ? ... #{a}"

#a = include Contactlab
#puts "include Contactlab class ? ... #{a.nil? ? false : true}"

a = load '/home/alan/NetBeansProjects/planner2/app/helpers/user_db_configuration_helper.rb'
puts "load user db configuration lib ? ... #{a}"

a = load '/home/alan/NetBeansProjects/planner2/app/helpers/swap_on_temporary_table_helper.rb'
puts "load my lib ? ... #{a}"

puts "\n"

include ProfilerHelper

customer = UserDbConfigurationHelper::CustomerDbConfiguration.new("root", "root", "localhost", "bulk")
puts customer
puts "\n"

Mysql.class_eval do  
  unless method_defined?(:run)
     alias_method :execute, :query
     define_method(:query) do
       execute()
     end
  end
end

conn = Mysql.new(customer.db_host, customer.db_user, customer.db_password, customer.db_name)

begin
  conn.execute("drop table _temp_swap_users_test001")
rescue
  puts $!
end

swap = SwapOnTemporaryTableHelper::Swap.new(
  customer, "test001"
).dump_and_load("select id, 0, name, 0, 0, 0, 0, 0 from student;")
