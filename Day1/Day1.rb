total = 0
digits = {"one"=>1, "two"=>2, "three"=>3, "four"=>4, "five"=>5, "six"=>6, "seven"=>7, "eight"=>8, "nine"=>9}
File.foreach("input.txt") do |line|
  #check for all digits, including digits spelled out with letters
  line = line.scan(/(?=([0-9]|one|two|three|four|five|six|seven|eight|nine))/)
  #puts line
  line = line.map{|num| num[0].gsub(/one|two|three|four|five|six|seven|eight|nine/, digits)}

  #combine first and last digit to form two-digit number
  puts Integer(line[0]+(line[line.length-1]))
  total += Integer(line[0]+(line[line.length-1]))
end

puts total