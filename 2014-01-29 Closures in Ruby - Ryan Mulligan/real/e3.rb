# Binding

local_variable = "hi"
@instance_variable = "world"
@@class_variable = "classy"
$global_variable = "blah"
Constant = "anople"

b = binding

# Eval

p b.eval("local_variable + ' ' + @instance_variable")

# See what identifiers are present in a binding

p binding.eval("local_variables")
p binding.eval("self.instance_variables")
p binding.eval("self.class.class_variables")

# p binding.eval("global_variables") # no point
# p binding.eval("self.class.constants")




