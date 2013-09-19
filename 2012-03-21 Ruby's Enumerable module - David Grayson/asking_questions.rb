# ASKING QUESTIONS

enum = [2,5,7,10]

p enum.include?(5)        # => true
p enum.member?(5)         # => true

p enum.all? { |x| x < 11 }   # => true
p enum.none? { |x| x > 11 }  # => true
p enum.any? { |x| x > 6 }    # => true
p enum.one? { |x| x.even? }  # => false

