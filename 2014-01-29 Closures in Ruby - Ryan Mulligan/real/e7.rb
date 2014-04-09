# Binding remembering example 2

def make_counter
  value = 0 # starting value of 0
  proc {
    p value
    value += 1
  }
end

counter = make_counter

counter.call
counter.call
counter.call
