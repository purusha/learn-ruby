#!/usr/bin/env ruby

def logger(args)
  puts "#{args}"
end

def is_numeric?(s)
    !!Float(s) rescue false
end

if __FILE__ == $PROGRAM_NAME  
  logger("called with: #{ARGV.length} parameter")
    
  ARGV.each do|a|
    logger "#{a}"
  end
  logger "\n"
  
  if ARGV.length > 1 and is_numeric? ARGV[0]
    logger "fico."
  else
    logger "u are dead !!?"
  end    
end