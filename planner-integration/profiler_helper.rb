module ProfilerHelper
  
  class A
    def method_missing(meth, *args, &block)
      p "called #{meth} with args #{args} and block #{block}"
    end
  end
  
  def prof(name="method", &block)
    puts("Profiling: '#{name}'...")
    t1 = Time.now
    block.call
    secs = Time.now - t1
    time = secs.round
    sec = time % 60
    time /= 60
    mins = time % 60
    puts("Time elapsed (min): %d.%d" % [mins, sec])
  end
  
  def logger
    A.new      
  end
  
end
