# BASIC SORTING

enum = [6, -1, 3, -4]

p enum.sort   # => [-4, -1, 3, 6]
p enum.min    # => -4
p enum.max    # => 6
p enum.minmax # => [-4, 6]

# ADVANCED SORTING

enum = [6, -1, 3, -4]

p enum.sort_by &:abs    # => [-1, 3, -4, 6]
p enum.sort_by { |x| x%10 }  # => [3, 6, -4, -1]

# (ALMOST ALWAYS) TOO ADVANCED SORTING

countries.sort { |c1,c2| c1.code <=> c2.code}

countries.sort_by :code

friends.sort { |a, b| arm_wrestle(a, b) }