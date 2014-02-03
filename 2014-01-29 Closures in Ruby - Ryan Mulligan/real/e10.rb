# Now for a parlor trick

# Changing self
counter = proc {
  p @count
  @count += 1  
}

class Counter
  def initialize
    @count = 0
  end
end

c = Counter.new
c.instance_eval(&counter)
c.instance_eval(&counter)
c.instance_eval(&counter)
counter.call
