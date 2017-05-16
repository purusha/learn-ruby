require "erb"

user_data = {
  "nome" => "Alan"
}

@my_data = {
  "work" => "developer"
}

puts ERB.new("ciao <%= user_data[\"nome\"] %>").result(binding);
puts ERB.new("are you a good <%= @my_data[\"work\"] %> ?").result(binding);
