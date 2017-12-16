jumps = File.read("day5.txt").chomp.split("\n").map &.to_i
max_index = jumps.size
index = 0
step_count = 0
while index < max_index
    jumps[index] += 1
    index += jumps[index] - 1
    step_count += 1
end
puts step_count
