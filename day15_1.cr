def gen(previous : Int64, factor : Int64)
    return previous * factor % 2147483647_i64
end

seedA = 16807_i64
seedB = 48271_i64
prevAValue = 873_i64
prevBValue = 583_i64
matched = 0
40000000.times do |time|
    prevAValue = gen(prevAValue, seedA)
    prevBValue = gen(prevBValue, seedB)
    if (prevAValue & 0xffff) == (prevBValue & 0xffff)
        matched += 1
    end
end
puts matched
