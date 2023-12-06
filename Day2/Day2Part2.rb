power_of_sets = 0

File.foreach("input.txt") do |line|
  maxcubes = {"red"=>0, "green"=>0, "blue"=>0} #reset for each game
  line.slice!(/\d+/)
  line.slice!("Game : ")
  rounds = line.split('; ') #split handfuls per game
  rounds.each do |round|
    handful = round.split(', ') #split by colour
    handful.each do |hand|
      hand.split(" ")
      #if current hand has more cubes than prev max, change the max
      if maxcubes[hand[/red|green|blue/]] < Integer(hand[/\d+/])
        maxcubes[hand[/red|green|blue/]] = Integer(hand[/\d+/])
      end
    end
  end
  power_of_sets += maxcubes["red"] * maxcubes["green"] * maxcubes["blue"] #multiply all values of cubes in a game
end

print power_of_sets