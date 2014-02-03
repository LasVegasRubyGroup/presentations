# binding includes self 
#                 (instance, class vars)
class Counter
  def initialize
    @count = 0
  end

  def make_counter
    proc {
      p @count
      @count += 1
    }
  end
end

c = Counter.new
counter1 = c.make_counter
counter2 = c.make_counter

counter1.call
counter2.call
counter1.call
counter2.call
