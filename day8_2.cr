instructions = {
    "inc" => -> (val : Int64, by : Int64) { val + by },
    "dec" => -> (val : Int64, by : Int64) { val - by }
}
comparisons = {
    ">" => -> (left : Int64, right : Int64) { left > right },
    ">=" => -> (left : Int64, right : Int64) { left >= right },
    "<" => -> (left : Int64, right : Int64) { left < right },
    "<=" => -> (left : Int64, right : Int64) { left <= right },
    "==" => -> (left : Int64, right : Int64) { left == right },
    "!=" => -> (left : Int64, right : Int64) { left != right }
}
registers = {} of String => Int64
ex = /([a-z]+) (inc|dec) (-?\d+) if ([a-z]+) (>|>=|<|<=|==|!=) (-?\d+)/
max = 0
File.read("day8.txt").chomp.split("\n").each do |it|
    match = ex.match(it).as Regex::MatchData
    if comparisons[match[5]].call(registers.fetch(match[4], 0_i64), match[6].to_i64)
        registers[match[1]] = instructions[match[2]].call(registers.fetch(match[1], 0_i64), match[3].to_i64)
    end
    max = Math.max(registers.values.max, max)
end
puts max
