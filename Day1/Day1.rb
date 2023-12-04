total = 0
File.foreach("input.txt") do |line|
  line = line.gsub(/[^0-9]/, '') #remove all chars except numbers
  #combine first and last digit to form two-digit number
  total += Integer(line[0]+(line[line.length-1]))
end

puts total