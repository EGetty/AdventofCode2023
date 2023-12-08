schematic = Array.new

# Convert input into 2D array
File.foreach("input.txt") do |line|
  line_arr = []
  line.each_char do |char|
    line_arr << char
  end
  schematic << line_arr
end

gear_locations = Hash.new{|k,v|k[v] = []}
total = 0
ratios = 0
i = 0 # Use to know which line we're currently in
is_gear = false # Set to true when gear (* symbol) is adjacent to two part numbers
# Go through each element in schematic and check to see if it's adjacent to a symbol
schematic.each do |line|
  num = "" # Append numbers as String for part ID, reset when symbol found
  is_part = false # If current number being looked at is adjacent to a symbol, flag as true
  gear_loc = []
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
              if (schematic[i+ind][j+jnd])[/\*/]
                # Save the location of gear to add later to dictionary
                is_gear = true
                gear_loc = [i+ind,j+jnd]
              end
              break
            end
          end
        end
      end
    else # If it's not a number or special character, ignore and reset the num "String"
      if !num.empty? && is_part
        total += Integer(num)
        # Add part numbers that are connected to gear
        if is_gear
          gear_locations[gear_loc].push(Integer(num))
          is_gear = false
        end
      end
      num = ""
      is_part = false
    end
    j+=1
  end
  i+=1
end

# Check if gear has multiple part numbers
gear_locations.each_value do |value|
  # If there's more than one part number, multiply them to get gear ratio
  if value.length > 1
    ratios += value.inject(:*)
  end
end

puts "Sum of all part numbers: #{total}"
puts "Sum of all gear ratios: #{ratios}"