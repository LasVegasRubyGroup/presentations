class Node
  attr_accessor :value, :next_node
	
  def initialize(value)
    @value = value
  end
end
	
class LinkedList 
  include Enumerable
  attr_accessor :next_node   # first node of list
	
	def initialize(values)
    values.inject(self) do |last_node, value|
      last_node.next_node = Node.new(value)
    end
  end
  
  def each
    n = self
    while n = n.next_node      
      yield n.value
    end
  end
end

list = LinkedList.new(1..7)
p list.count       # => 7
p list.to_a        # => [1, 2, 3, 4, 5, 6, 7]
p list.entries     # same as #to_a
p list.inject(:+)  # => 28
