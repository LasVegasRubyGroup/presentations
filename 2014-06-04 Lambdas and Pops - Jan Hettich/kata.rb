# Permuatation - rearrangment of {1,..,n}
#  or a "bijective mapping" of {1,..,n} to itself
# Cycle - cyclical permutation that may move only
#  a subset of elements; e.g  1->5, 5->2, 2->1
# Represent cycle as an array: [1,5,2]
# Cycle decomposition as array of arrays

class P

  attr_accessor :f
  class << self
    attr_accessor :size

    def from_cycle(c)
      P.new ->(x) do
        j = c.index(x)
        j ? c[(j+1)%c.size] : x
      end
    end

    def from_cycles(*c_array)
      id = P.new(->(x){x})
      c_array.reduce(id){|p,c| p * from_cycle(c)}
    end

  end

  def initialize(f)
    raise "size not specified" if P.size.nil?
    @f = f
  end

  def to_a
    (1..P.size).map(&f)
  end

  def ==(p)
    (p.is_a? P) && self.to_a == p.to_a
  end

  def [](x)
    f[x]
  end

  def compose(g)
    P.new(->(x){f[g[x]]})
  end
  
  def *(g)
    g.compose(f)
  end

  def cycles
    cycles = []
    bucket = (1..P.size).to_a
    while !bucket.empty?
      cycle = []
      next_elt = bucket[0]
      begin
        cycle << next_elt
        bucket -= [next_elt]
        next_elt = self[next_elt]
      end until cycle.include? next_elt
      cycles << cycle
    end
    cycles.reject! {|c| c.count <=1}
    cycles << [1] if cycles.empty?
    cycles
  end

end