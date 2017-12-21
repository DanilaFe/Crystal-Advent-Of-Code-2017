require "./knot_hash.cr"
input = "jxqlasbh-"
total = 0
128.times do |it|
    hash = knot_hash((input + it.to_s).chars.map &.ord)
    bits = hash.chars.map &.to_i(16).to_s(2).rjust(2, '0')
    total += bits.join("").count('1')
end
puts total
