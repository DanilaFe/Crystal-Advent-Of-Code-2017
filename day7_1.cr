ex = /([a-z]+) \((\d+)\)(?: -> (.+))?/
weight_hash = {} of String => Int32
tree_hash = {} of String => Array(String)
have_parent = [] of String
File.read("day7.txt").chomp.split("\n").each do |it|
    match = ex.match(it).as Regex::MatchData
    name = match[1]
    weight = match.[2]
    children = match.[3]?
        child_array = children.nil? ? ([] of String) : children.split(", ")
    weight_hash[name] = weight.to_i
    tree_hash[name] = child_array
    have_parent.concat child_array
end
puts "#{(tree_hash.keys - have_parent)[0]}"
