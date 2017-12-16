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

x = 0
y = 0
state = :right
n = 0
steps = 0
input = 289326
while n < input - 1
    steps += increases.fetch(state, 0)
    dx = stepsX.fetch(state, 0)
    dy = stepsY.fetch(state, 0)
    steps.times do |time|
        if n >= input - 1
            break
        end
        x += dx
        y += dy
        n += 1
    end
    state = states[state]
end
puts x.abs+y.abs
