def frequency(it)
    new_hash = {} of Char => Int32
    it.chars.each do |char|
        new_hash[char] = new_hash.fetch(char, 0) + 1
    end
    return new_hash
end

passes = File.read("day4.txt").chomp.split("\n").map &.split(" ")
non_duplicates = passes.select { |it| it.uniq.size == it.size }
count = non_duplicates.count do |it|
    frequencies = it.map do |it|
        frequency(it)
    end
    (frequencies.product frequencies).count do |pair|
        pair[0] == pair[1]
    end == frequencies.size
end
puts count
