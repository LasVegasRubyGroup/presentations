puts "FILTERING BY VALUE"

names = ["judd", "russ", "david",
  "paul", "ryan"]
	
names.select { |n| n[1] == "u" }
  # => ["judd", "russ"]
	
names.reject { |n| n.length < 5 }
  # => ["david"]
	
names.grep(/u/)
  # => ["judd", "russ", "paul"]
	
p [1,4.0,nil,Object,5].grep(Integer)
  # => [1,5]

puts "FILTERING BY POSITION IN SERIES"

days = ["mon", "tue", "wed",
  "thu", "fri", "sat", "sun"]

days.first     # => "mon"	
days.first(2)  # => ["mon", "tue"]
	
days.drop(5)                        # => ["sat", "sun"]
days.drop_while { |x| x != "sat" }  # => ["sat", "sun"]

days.take(2)                        # => ["mon", "tue"]
days.take_while { |x| x != "wed" }  # => ["mon", "tue"]

puts "DIVIDING INTO SUBSETS"

hand = ["7H", "AS", "KS", "JS", "9H"]

p hand.chunk{|c| c[1]}.each { |suit, consecutive_cards| :stuff }
  # yields "H", ["7H"]
  #        "S", ["AS, "KS", JS"]
	#        "H", ["9H"]

hand = ["7H", "AS", "KS", "JS", "9H"]

p hand.group_by { |c| c[1] }
  # { "H"=>["7H", "9H"], "S"=>["AS", "KS", "JS"] }

puts "DIVIDING INTO SUBSETS: SLICE_BEFORE"

(3..11).slice_before{ |n| n%5 == 0}.each { |s| :stuff }
  # yields [3, 4]
  #        [5, 6, 7, 8, 9],
	#        [10, 11]
	
puts "SEARCHING FOR ONE ELEMENT"

names = ["judd", "russ", "david",
  "paul", "ryan"]
	
p names.find_index("david")  # => 2
p names.find_index { |n| n[1] == "a" }  # => 2

p names.find { |n| n[1] == "a" }   # => "david
p names.detect { |n| n[1] == "a" } # => "david"
