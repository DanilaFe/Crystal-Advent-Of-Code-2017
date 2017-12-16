passes = File.read("day4.txt").chomp.split("\n").map &.split(" ")
puts passes.count { |it| it.uniq.size == it.size }
