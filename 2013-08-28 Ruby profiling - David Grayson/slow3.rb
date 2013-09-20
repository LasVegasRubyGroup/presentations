class Foo
  def x
    y; z; z
  end

  def y
    50.times { z }
  end

  def z
    waste_cpu 0
    waste_cpu 0.04
  end

  def waste_cpu(seconds)
    sleep seconds
    #start = Time.now
    #while(Time.now - start < seconds); end
  end
end

require 'rblineprof'
profile = lineprof(/./) do
  Foo.new.x
end

File.readlines(__FILE__).each_with_index do |line, num|
  sample = profile[__FILE__][num+1]
  if sample[0] > 0
    sample_data = sprintf "%8.1fms %8.1fms %7d", sample[0]/1000.0, sample[1]/1000.0, sample[2], line
  end
  printf "%30s |  %s", sample_data, line
end
