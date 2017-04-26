#require 'securerandom'
#in ruby 186 non c'è questo modulo ... !!?

begin
  require 'openssl'
rescue LoadError
end

module SecureRandom
  # SecureRandom.random_bytes generates a random binary string.
  #
  # The argument n specifies the length of the result string.
  #
  # If n is not specified, 16 is assumed.
  # It may be larger in future.
  #
  # If secure random number generator is not available,
  # NotImplementedError is raised.
  def self.random_bytes(n=nil)
    n ||= 16
    if defined? OpenSSL::Random
      return OpenSSL::Random.random_bytes(n)
    end
    if !defined?(@has_urandom) || @has_urandom
      @has_urandom = false
      flags = File::RDONLY
      flags |= File::NONBLOCK if defined? File::NONBLOCK
      flags |= File::NOCTTY if defined? File::NOCTTY
      flags |= File::NOFOLLOW if defined? File::NOFOLLOW
      begin
        File.open("/dev/urandom", flags) {|f|
          unless f.stat.chardev?
            raise Errno::ENOENT
          end
          @has_urandom = true
          ret = f.readpartial(n)
          if ret.length != n
            raise NotImplementedError, "Unexpected partial read from random device"
          end
          return ret
        }
      rescue Errno::ENOENT
        raise NotImplementedError, "No random device"
      end
    end
    raise NotImplementedError, "No random device"
  end

  # SecureRandom.hex generates a random hex string.
  #
  # The argument n specifies the length of the random length.
  # The length of the result string is twice of n.
  #
  # If n is not specified, 16 is assumed.
  # It may be larger in future.
  #
  # If secure random number generator is not available,
  # NotImplementedError is raised.
  def self.hex(n=nil)
    random_bytes(n).unpack("H*")[0]
  end

  # SecureRandom.base64 generates a random base64 string.
  #
  # The argument n specifies the length of the random length.
  # The length of the result string is about 4/3 of n.
  #
  # If n is not specified, 16 is assumed.
  # It may be larger in future.
  #
  # If secure random number generator is not available,
  # NotImplementedError is raised.
  def self.base64(n=nil)
    [random_bytes(n)].pack("m*").delete("\n")
  end

  # SecureRandom.random_number generates a random number.
  #
  # If an positive integer is given as n,
  # SecureRandom.random_number returns an integer:
  # 0 <= SecureRandom.random_number(n) < n.
  #
  # If 0 is given or an argument is not given,
  # SecureRandom.random_number returns an float:
  # 0.0 <= SecureRandom.random_number() < 1.0.
  def self.random_number(n=0)
    if 0 < n
      hex = n.to_s(16)
      hex = '0' + hex if (hex.length & 1) == 1
      bin = [hex].pack("H*")
      mask = bin[0].ord
      mask |= mask >> 1
      mask |= mask >> 2
      mask |= mask >> 4
      begin
        rnd = SecureRandom.random_bytes(bin.length)
        rnd[0] = (rnd[0].ord & mask).chr
      end until rnd < bin
      rnd.unpack("H*")[0].hex
    else
      # assumption: Float::MANT_DIG <= 64
      i64 = SecureRandom.random_bytes(8).unpack("Q")[0]
      Math.ldexp(i64 >> (64-Float::MANT_DIG), -Float::MANT_DIG)
    end
  end

end

# Added by joelparkerhenderson@gmail.com for backwards compatibility with Ruby 1.8
class Fixnum
 def ord
  return self
 end
end

module SecureRandom
  class << self
    def method_missing(method_sym, *arguments, &block)
      case method_sym
      when :urlsafe_base64
        r19_urlsafe_base64(*arguments)
      when :uuid
        r19_uuid(*arguments)
      else
        super
      end
    end
    
    private
    def r19_urlsafe_base64(n=nil, padding=false)
      s = [random_bytes(n)].pack("m*")
      s.delete!("\n")
      s.tr!("+/", "-_")
      s.delete!("=") if !padding
      s
    end

    def r19_uuid
      ary = random_bytes(16).unpack("NnnnnN")
      ary[2] = (ary[2] & 0x0fff) | 0x4000
      ary[3] = (ary[3] & 0x3fff) | 0x8000
      "%08x-%04x-%04x-%04x-%04x%08x" % ary
    end
  end
end

class EventQueue
  attr_accessor :messages
  
  def initialize
    @messages = []
  end

  def enqueue(event, args, state)
    @messages << [event, args, state]
  end
end

module Notifier
  def notify_on(event)
    guid = SecureRandom.uuid    
    puts "#{guid} ==> #{event}"
    
    define_method("#{guid}") do |*args|
      @event_queue.enqueue(event, args, :start)
      begin
        result = __send__("#{guid}_#{event}", *args)
      ensure
        @event_queue.enqueue(event, args, :end)
      end
      result
    end
        
    alias_method "#{guid}_#{event}", event
    alias_method event, "#{guid}"    
  end
end

class Store
  extend Notifier
    
  def initialize(event_queue)
    @event_queue = event_queue
  end
    
  def order_purchase(user, items)
    #@event_queue.enqueue(__method__, [user, items], :start)
    do_stuff
    #@event_queue.enqueue(__method__, [user, items], :end)
  end

  def decrease_inventory(items)
    #@event_queue.enqueue(__method__, [items], :start)
    do_stuff
    #@event_queue.enqueue(__method__, [items], :end)
  end

  notify_on :order_purchase
  notify_on :decrease_inventory      
    
  private
  
  def do_stuff
    puts "called from #{caller[0]}"
  end  
end


puts "#" * 100
queue = EventQueue.new
store = Store.new(queue)
store.order_purchase("alan", ["book", "pen"])
puts "#" * 100
puts "messages = #{queue.messages.inspect}"
puts "#" * 100
puts store.methods.sort - Object.methods.sort
