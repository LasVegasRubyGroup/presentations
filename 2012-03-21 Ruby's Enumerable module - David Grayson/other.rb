enum = 1 ..4

p enum.inject(:+) # 1+2+3+4 => 10
p enum.inject(0.5, :*) # 0.5*1*2*3*4 => 12.0

enum.inject { |memo, x| :stuff }
enum.inject(0) { |memo, x| :stuff }

def play_chess(*args)
  p args
end

team1 = "a".."c"
team2 = "x".."z"

team1.zip(team2) do |player1, player2|
  play_chess player1, player2
end

require 'set'
names = Set.new ["richard hoppes", "nicholas shook"]
p names.map &:upcase # => ["RICHARD HOPPES", "NICHOLAS SHOOK"]

p names.map &:split  # => [["richard", "hoppes"], ["nicholas", "shook"]]

p names.flat_map &:split  # => ["richard", "hoppes", "nicholas", "shook"]

puts "LAZY"

a = [1,2,3,4,2,5].lazy.map { |x| x * 10 }.
  select { |x| x > 30 }  # => no evaluation
	
a.to_a # => [40, 50]