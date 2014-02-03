# Proc/Lambdas are blocks of code you can reference
# They are "first class"

printer = proc {
  p "1"
}

printer.call

# How does scope work for a Proc?
