total_points = 0
total_cards = 0
win_amounts = [] # Used to store the amount of wins each Card has

# Each game is split into one line
File.foreach("input.txt") do |line|
  #total_cards+=1
  score = 0
  # Initial setup removing everything except the tickets numbers
  line.slice!(/\d/)
  line.slice!("Card : ")
  line = line.strip
  # Split the ticket into winning numbers and 'your' numbers
  ticket = line.split(' | ')
  # Convert values from String into an array of Integers
  winning_nums=ticket[0].split(' ')
  my_nums=ticket[1].split(' ')
  # Compare the numbers to see how many numbers are winning numbers
  wins = (winning_nums & my_nums).length
  if wins!=0 then score=1 end # Set score to 1 if there's any wins, so we can enter the scoring loop
  # First point is 1, then doubled for each match after first
  plays=1
  while plays < wins do
    plays+=1
    score*=2
  end
  # Add the total from each ticket
  total_points += score
  win_amounts.append(wins)
end

total_wins = Array.new(win_amounts.length) {|i| i = 1} # Keep track of the amount of tickets including copies
loc = 0 # Use this to keep track of position in the loop
win_amounts.each do |win|
  total_wins[loc].times do
    index = loc+1 # Wins only add future card copies, so we start one card ahead of our current location
    win.times do
      total_wins[index] += 1
      index+=1
    end
  end
  total_cards += total_wins[loc]
  loc += 1
end

puts "Total points: #{total_points}"
puts "Total cards: #{total_cards}"