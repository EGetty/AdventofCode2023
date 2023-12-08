schematic = Array.new

# Convert input into 2D array
File.foreach("input.txt") do |line|
  line_arr = []
  line.each_char do |char|
    line_arr << char
  end
  schematic << line_arr
end

total = 0
ratios = 0
i = 0 # Use to know which line we're currently in
# Go through each element in schematic and check to see if it's adjacent to a symbol
schematic.each do |line|
  num = "" # Append numbers as String for part ID, reset when symbol found
  is_part = false # If current number being looked at is adjacent to a symbol, flag as true
  j = 0 # Use to know which char we're currently at
  line.each do |char|
    # If number is found, check all adjacent spots
    if char[/\d+/]
      num += char
      for ind in -1..1 do
        for jnd in -1..1 do
          if i+ind >= 0 && j+jnd >= 0 && i+ind < schematic.length && j+jnd < schematic[0].length# && (i+ind!=0 && j+jnd!=0)
            if !((schematic[i+ind][j+jnd])[/\.|\d+|\s+/])
              is_part = true
              break
            end
          end
        end
      end
    else # If it's not a number or special character, ignore and reset the num "String"
      if !num.empty? && is_part
        total += Integer(num)
      end
      num = ""
      is_part = false
    end
    j+=1
  end
  i+=1
end

puts "Sum of all part numbers: #{total}"
puts "Sum of all gear ratios: #{ratios}"