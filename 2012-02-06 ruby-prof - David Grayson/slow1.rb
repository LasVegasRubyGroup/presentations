class Foo
  def x
    y; z; z
  end

  def y
    50.times { z }
  end

  def z
    waste_cpu 0.04
  end

  def waste_cpu(seconds)
    start = Time.now
    while(Time.now - start < seconds); end
  end
end

Foo.new.x
