input = File.read("day9.txt").chomp.chars
score = 0
level = 0
index = 0
while index < input.size
    if input[index] == '<'
        index += 1
        while input[index] != '>'
            if input[index] != '!'
                score += 1
            end
            index += (input[index] == '!') ? 2 : 1
        end
    end
    index += 1
end
puts score
