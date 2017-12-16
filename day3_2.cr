states = {
    :left => :down,
    :down => :right,
    :right => :up,
    :up => :left
}
stepsX = {
    :left => -1,
    :right => 1
}
stepsY = {
    :down => -1,
    :up => 1
}
increases = {
    :left => 1,
    :right => 1
}

x = 198
y = 198
state = :right
steps = 0
input = 289326
memory = Array.new(399) do |num|
    Array.new(399, 0)
end
memory[x][y] = 1
while memory[x][y] < input
    steps += increases.fetch(state, 0)
    dx = stepsX.fetch(state, 0)
    dy = stepsY.fetch(state, 0)
    steps.times do |time|
        if memory[x][y] >= input - 1
            break
        end
        x += dx
        y += dy
        i = -1
        while i <= 1
            j = -1
            while j <= 1
                if !(i == 0 && j == 0)
                    memory[x][y] += memory[x+i][y+j]
                end
                j += 1
            end
            i += 1
        end
    end
    state = states[state]
end
puts memory[x][y]
