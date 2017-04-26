puts "Test with Ruby %s" % RUBY_VERSION
puts "*" * 50

def chech_gmail(user_email)
  puts "checking gmail on #{user_email}"
  if (user_email.to_s.downcase =~ /@gmail.com/)
    puts "is Gmail"
  else
    puts "is not Gmail"
  end   
end

["test1@gmail.com", "test2@hotmail.com", "TEST3@GMAIL.COM", "TEST4@HOTMAIL.COM"].each { 
  |e| chech_gmail(e) 
  puts ""
}
