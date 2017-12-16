lines = File.read("day2.txt").chomp.split("\n") 
total = 0
lines.each do |line|
    digits = line.split("\t").map &.to_i
    max = digits.max
    min = digits.min
    total += max - min
end
puts total
