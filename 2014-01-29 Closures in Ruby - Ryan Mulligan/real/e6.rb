# Procs/lambdas remember the binding they were defined in

my_number = 0
counter = proc {
  p my_number
  my_number += 1
}

def caller(callee)
  callee.call
end

caller(counter)
caller(counter)
caller(counter)
puts my_number
