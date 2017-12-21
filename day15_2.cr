def gen(previous : Int64, factor : Int64)
    return previous * factor % 2147483647_i64
end

def gen_modulo(previous : Int64, factor : Int64, mod : Int64)
    loop do
        previous = gen(previous, factor)
        break if previous % mod == 0
    end
    return previous
end

seedA = 16807_i64
seedB = 48271_i64
prevAValue = 873_i64
prevBValue = 583_i64
matched = 0
5000000.times do |time|
    prevAValue = gen_modulo(prevAValue, seedA, 4_i64)
    prevBValue = gen_modulo(prevBValue, seedB, 8_i64)
    if (prevAValue & 0xffff) == (prevBValue & 0xffff)
        matched += 1
    end
end
puts matched
