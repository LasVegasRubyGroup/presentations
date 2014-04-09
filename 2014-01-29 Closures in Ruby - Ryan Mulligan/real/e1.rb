old_global_variables = global_variables
old_constants = self.class.constants

# Identifiers in Ruby

local_variable = "hi"
@instance_variable = "world"
@@class_variable = "classy"
$global_variable = "blah"
Constant = "anople"


# See what identifiers are present

p local_variables
p self.instance_variables
p self.class.class_variables
p global_variables - old_global_variables
p global_variables
p self.class.constants - old_constants
