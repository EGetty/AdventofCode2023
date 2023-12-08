total_points = 0

# Each game is split into one line
File.foreach("input.txt") do |line|
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
  i=1
  while i < wins do
    i+=1
    score*=2
  end
  # Add the total from each ticket
  total_points += score
end

puts "Total points: #{total_points}"