ex = /(\d+): (\d+)/
def cost(scanners, offset)
    return scanners.map { |it|((it[0] + offset) % ((it[1] - 1) * 2) == 0) ? it[0] * it[1] + 1 : 0 }.sum
end
scanners = File.read("day13.txt").chomp.split("\n").map do |it|
    m = ex.match(it).as Regex::MatchData
    { m[1].to_i, m[2].to_i }
end
offset = 0
until cost(scanners, offset) == 0
    offset += 1
end
puts offset
