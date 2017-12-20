input = File.read("day9.txt").chomp.chars
score = 0
level = 0
index = 0
while index < input.size
    current_char = input[index]
    if current_char == '{'
        level += 1
        score += level
    elsif current_char == '}'
        level -= 1
    elsif current_char == '<'
        index += 1
        while input[index] != '>'
            index += (input[index] == '!') ? 2 : 1
        end
    end
    index += 1
end
puts score
