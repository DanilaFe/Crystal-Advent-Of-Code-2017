jumps = File.read("day5.txt").chomp.split("\n").map &.to_i
max_index = jumps.size
index = 0
step_count = 0
while index < max_index
    change = jumps[index] >= 3 ? -1 : 1
    jumps[index] += change
    index += jumps[index] - change
    step_count += 1
end
puts step_count
