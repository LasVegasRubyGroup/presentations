class Binding
  def variables
    {
      local_variables: [eval("local_variables"),eval("local_variables").map{|s|eval(s.to_s)}],
      instance_variables: eval("self.instance_variables"),
      class_variables: eval("self.class.class_variables")
    }
  end
end

class MyProgram
  A = "constant"
  a = "local"
  @a = "instance"
  @@a = "class"
  puts "class level: ", binding.variables
  
  def m
    #B = "constant" # dynamic constant assignment
    b = "local"
    @b = "instance"
    @@b = "class"
    puts "method: ", binding.variables
    @method_binding = binding
    [proc {
      #C = "constant" # dynamic constant assignment 
      c = "local"
      @c = "instance"
      @@c = "class"
      puts "proc: ", binding.variables
    },
      proc { |;b|
        b= "proc"
      #C = "constant" # dynamic constant assignment 
      c = "local"
      @c = "instance"
      @@c = "class"
      puts "proc2: ", binding.variables
    }]
  end
  def method_binding
    @method_binding.variables
  end
end
prog = MyProgram.new
this_proc = prog.m
puts "Method before proc called: ", prog.method_binding
this_proc.each {|p|p.call}
puts this_proc.first.binding.eval("b")
puts "Method after proc called: ", prog.method_binding
