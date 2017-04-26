require 'my_module'
require 'enum'

class MiaClass  
  include MyModule
  
  # module Behaviour
    # DAYS_LIMIT = 180
  # end  
  
  def call
    moduleFunction
  end
  
  def boo
    puts self
  end  
  
  def call2
    puts Behaviour::DAYS_LIMIT
  end
end

MiaClass.new.boo
MiaClass.new.call
MiaClass.new.call2