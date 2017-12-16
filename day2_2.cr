lines = File.read("day2.txt").chomp.split("\n") 
total = 0
lines.each do |line|
    digits = line.split("\t").map &.to_i
    pairs = digits.product digits
    pair = pairs.find do |pair|
        pair[0] > pair[1] && pair[0] % pair[1] == 0
    end
    if pair.nil?
        next
    end
    total += pair[0] / pair[1]
end
puts total
