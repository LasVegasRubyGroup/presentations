# Scope of local variables
local_variable = 1

# def, class, module make new scopes
def method
  p local_variables
end
method

class A
  p local_variables
end

module B
  p local_variables
end

# Scope of instance/class variables depends on self
