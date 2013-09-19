class Neighborhood
  def each_house
    yield 3001 # insert complex code here
    yield 3002
  end

  def houses
    enum_for :each_house
  end
end

p Neighborhood.new.houses.max   # => 3002

def fibbonacci(a=0, b=1)
  return enum_for(:fibbonacci,a,b) if !block_given?
  yield a
	yield b
  while true
    a, b = b, a + b
    yield b
  end
end

alias :fib :fibbonacci

fibbonacci.first(10)
  # => [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]
	
#fibbonacci.each_cons(2) { |x, y| puts y.to_f/x }
  # => approaches Golden Ratio, 1.61803399

fibbonacci.each_with_index do |n, index|
  puts "#{index}: #{n}"
  break if n > 10
end

fibbonacci.each_cons(2) do |x, y|
  puts "%10f %2d %2d" % [y.to_f/x, y, x]
  break if x > 1000
end


### SORTING

### 50% of all sorting
p [9,1,2,7].sort    # also #min and #max

### 90% of all sorting
#players.sort_by &:score
#players.sort_by { |p| [p.name, p.score] }

### REALLY SPECIAL CASES
#players.sort_by do |p1, p2|
#  arm_wrestle(p1, p2)
#end

puts "HI"
fib.each { break }
fib.each_with_index { break }
fib.each_cons(2) { break }
fib.each_slice(3) { break }
fib.detect { |n| n > 10 }
fib.find_index { |n| n > 10 }
fib.each_with_object({}) { break }
fib.inject { |m,x| break }
fib.first(10)
puts "HI2"
fib.take(10)
fib.take_while { |n| n < 10 }
fib.chunk { |x| x.even? }.first
puts "HI3"
fib.slice_before { |x| x.even? }.first
fib3_3 = fib(3,3)
puts "HI4"

entrants = { :jason => 2, :jeremy => 3}
entrants.flat_map { |name, amount| [name] * amount }
  # => [:jason, :jason, :jeremy, :jeremy, :jeremy] 