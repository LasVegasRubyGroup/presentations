s = "Hi world"

def caller(proc)
  p "caller", binding.local_variable_defined?("s")
  proc.call
end

caller(Proc.new { p "proc", binding.local_variable_defined?("s")})
