class A
  def initialize(p)
    @p = p
  end
  def run
    instance_eval &@p
  end
end

p = proc {|*list| puts list.inspect;self}
puts A.new(p).run.inspect
