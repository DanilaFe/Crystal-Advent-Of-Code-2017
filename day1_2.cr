digits = File.read("day1.txt").delete('\n').split("").map &.to_i
size = digits.size
total = 0
size.times do |index|
    if(digits[index] == digits[(index + size/2) % size]) 
        total += digits[index] 
    end
end
puts total
