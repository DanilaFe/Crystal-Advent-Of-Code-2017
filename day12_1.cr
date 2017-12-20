def find_group(paths, current)
    visited = [] of Int32
    queue = [current]
    while !queue.empty?
        current = queue.first
        if !visited.includes? current
            visited << current
            queue.concat(paths[current])
        end
        queue.delete current
    end
    return visited
end

paths = {} of Int32 => Array(Int32)
ex = /(\d+) <-> (.+)/
File.read("day12.txt").chomp.split("\n").each do |it|
    match = ex.match(it).as Regex::MatchData
    from = match[1].to_i
    to = match[2].split(", ").map &.to_i
    paths[from] = to
end
puts find_group(paths, 0).size
