module Uno
  
  def method_one
  end
  
  module_function :method_one
  
  def method_two
  end
  
  alias_method :method_2, :method_two
  
end