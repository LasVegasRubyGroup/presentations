require_relative 'myextension'

m = MyClass.new
m.foo 12
m.foo "hi"
m.foo [0, 3]

p m.foo2
