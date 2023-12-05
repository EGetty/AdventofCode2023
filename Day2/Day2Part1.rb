total = 0
maxcubes = {"red"=>12, "green"=>13, "blue"=>14}

File.foreach("input.txt") do |line|
  possible = true #used to determine if a hand has impossible amount of cubes
  id = Integer(line[/\d+/])
  line.slice!(/\d+/)
  line.slice!("Game : ")
  rounds = line.split('; ') #split handfuls per game
  rounds.each do |round|
    handful = round.split(', ') #split by colour
    handful.each do |hand|
      hand.split(" ")
      #check to see if hand has impossible amount of cubes
      if maxcubes[hand[/red|green|blue/]] < Integer(hand[/\d+/])
        possible = false
      end
    end
  end
  #don't add rounds IDs that aren't possible
  if !possible then next end
  total += id
end

print total