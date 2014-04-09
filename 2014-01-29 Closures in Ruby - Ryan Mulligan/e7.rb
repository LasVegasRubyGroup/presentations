# Modules and defs introduce their own bindings
s = 'Hello World'

module B
  #p s #=> NameError: undefined local variable or method `s' for B:Module
end

class A
  #p s #=> NameError: undefined local variable or method `s' for A:Class
end

def method
  p s
end
method #=> NameError: undefined local variable or method `s' for main:Object
