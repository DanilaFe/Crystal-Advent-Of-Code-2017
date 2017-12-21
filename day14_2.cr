require "./knot_hash.cr"

def flood(array, y, x, num)
    if (x < 0) || (x >= array[0].size) || (y < 0) || (y >= array.size) || (array[y][x] != 1)
        return
    end
    array[y][x] = num
    flood(array, y, x-1, num)
    flood(array, y, x+1, num)
    flood(array, y-1, x, num)
    flood(array, y+1, x, num)
end

input = "jxqlasbh-"
total = 0
map = [] of Array(Int32)
128.times do |it|
    hash = knot_hash((input + it.to_s).chars.map &.ord)
    bits = hash.chars.map &.to_i(16).to_s(2).rjust(4, '0')
    map.push bits.join("").chars.map &.to_i
end
flood_with = 2
128.times do |it|
    while map[it].includes? 1
        flood(map, it, map[it].index(1).as Int, flood_with)
        flood_with += 1
    end
end
puts flood_with-2
