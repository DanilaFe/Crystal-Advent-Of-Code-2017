combinations = [] of Array(Int32)
current = File.read("day6.txt").chomp.split("\t").map &.to_i
cycle_count = 0
while true
    to_redistribute = current.max
    start_index = (current.index to_redistribute).as Int
    current[start_index] = 0
    while to_redistribute > 0
        start_index = (start_index + 1) % current.size
        current[start_index] += 1
        to_redistribute -= 1
    end
    cycle_count += 1
    if combinations.includes? current
        break
    end
    combinations.push current.dup
end
previous_index = (combinations.index current).as Int
puts "#{cycle_count - 1 - previous_index}"
