require "./knot_hash.cr"

puts knot_hash(File.read("day10.txt").chomp.chars.map &.ord)
