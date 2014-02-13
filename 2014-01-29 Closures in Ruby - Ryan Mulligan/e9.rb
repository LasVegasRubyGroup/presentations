class Binding
  def variables
    {
      local_variables: [eval("local_variables"),eval("local_variables").map{|s|eval(s.to_s)}],
      instance_variables: eval("self.instance_variables"),
      class_variables: eval("self.class.class_variables")
    }
  end
end

a = 1
puts local_variables.inspect #=> [:a]
proc { |;a|
  puts local_variables.inspect #=> [:a,:a,:a]
}.call

puts local_variables.inspect #=> []
proc { |;b|
  puts local_variables.inspect #=> [:b]
}.call

