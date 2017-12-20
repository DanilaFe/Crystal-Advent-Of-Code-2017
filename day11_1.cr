paths = {
    "n" => { 0,  1 },
    "s" => { 0, -1 },
    "ne" => { 1, 1 },
    "nw" => { -1, 1 },
    "se" => { 1, -1 },
    "sw" => { -1, -1 }
}
x = 0
y = 0
File.read("day11.txt").chomp.split(",").map{ |it| paths[it] }.each do |dir|
    x += dir[0]
    y += dir[1]
end
puts Math.max(x.abs, y.abs)
