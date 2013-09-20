# BASIC USE

enum = "a".."f"

p enum.to_a     # => ["a", "b", "c", "d", "e", "f"]
p enum.entries  # => ["a", "b", "c", "d", "e", "f"]

p enum.count                   # => 6
p enum.count("b")              # => 1
p enum.count { |s| s <= "c" }  # => 3

# ITERATION WITH ENUMERATOR
enumerable = 1 ..3
enumerator = enumerable.to_enum

p enumerator.next # => 1
p enumerator.next # => 2
p enumerator.next # => 3
p enumerator.next # => StopIteration exception


# ITERATION

enum = 1..6

enum.each { |x| :stuff }
enum.each_entry { |x| :stuff }
# yields 1, 2, 3, 4, 5, 6

enum.each_cons(2) { |x, next_x| :stuff }
# yields [1,2], [2,3], [3,4] :stuff

enum.each_slice(3) { |x0, x1, x2| :stuff }
# yields [1,2,3], [4,5,6]

enum.each_with_index { |x, index| :stuff }
# yields [1, 0], [2, 1], [3, 2] :stuff

enum.reverse_each { |x| :stuff }
# yields 6, 5, 4, 3, 2, 1

players = ["alan", "brian", "caterina",
           "david", "errol", "fay"]
					 
players.cycle { |player| :stuff }

# Equivalent to:
while true
  players.each do |player|
	  :stuff
	end
end

# Can also specify number of cycles:
players.cycle(3) { |player| :stuff }
