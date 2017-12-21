ex = /(\d+): (\d+)/
scanners = File.read("day13.txt").chomp.split("\n").map do |it|
    m = ex.match(it).as Regex::MatchData
    { m[1].to_i, m[2].to_i }
end
cost = scanners.map { |it|(it[0] % ((it[1] - 1) * 2) == 0) ? it[0] * it[1] : 0 }.sum
puts cost
