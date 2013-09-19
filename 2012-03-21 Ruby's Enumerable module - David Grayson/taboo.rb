@players = ["alan", "brian", "caterina",
  "david", "errol", "fay"]

# Divide into teams
teams = [[], []]
@players.each_slice(2) do |p1, p2|
  teams[0] << p1
	teams[1] << p2 if p2
end
p teams # => [["alan", "caterina", "errol"], ["brian", "david", "fay"]]

# Better way to divide into teams.
teams = @players.partition { |p| @players.index(p).even? }
p teams # => [["alan", "caterina", "errol"], ["brian", "david", "fay"]]

while true
  players.each do |player|
	  # player takes a turn
	end
end if false

@players.cycle do |player|
  # player takes a turn
end if false

@players.cycle(3) do |player|
  # player takes a turn
end

#teams = players.partition.with_index { |player, index| index.even? }
#p teams

def turn_score(player, goal_word, taboo_words)
	return -1 if words_said_by(player).any? do |word|
	  taboo_words.include?(word)
	end
	
	guessed_words = @players.flat_map do |player|
	  words_said_by(player)
	end
	return 1 if guessed_words.member?(goal_word)
	
	return 0
end


@w = {"alan" => ["banana", "shrubs"], "david" => "bushes"}
def words_said_by(player)
  @w[player] || []
end
p turn_score("alan", "bush", ["plant", "shrub"])

###############################
puts "WINNERS"
require 'ostruct'
team1 = OpenStruct.new(score: 10, to_s: "Team1")
team2 = OpenStruct.new(score: 20, to_s: "Team2")

teams = [team1, team2]

winning_team = teams.max_by &:score
losing_team = teams.min_by &:score

losing_team, winning_team = teams.minmax_by &:score

losing_team, winning_team = teams.sort_by &:score
p losing_team, winning_team

