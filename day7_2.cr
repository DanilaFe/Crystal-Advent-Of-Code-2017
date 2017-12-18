def balance_data(tree_hash, weight_hash, name)
    weight = weight_hash[name]
    children = tree_hash[name]
    child_data = children.map do |it|
        balance_data(tree_hash, weight_hash, it).as(Tuple(Int32, Bool))
    end
    weights = child_data.map &.[0]
    balanced = child_data.map &.[1]
    total_weight = weight + weights.sum
    children_balanced = balanced.size == 0 || balanced.reduce { |it, other| it && other }
    this_balanced = weights.size == 0 || weights.uniq.size == 1

    if children_balanced && !this_balanced 
        frequencies = {} of Int32 => Int32
        weights.each { |value| frequencies[value] = frequencies.fetch(value, 0) + 1 }
        wrong_weight = weights.min_by { |it| frequencies[it] }
        right_weight = weights.max_by { |it| frequencies[it] }
        node_weight = weight_hash[children[(weights.index wrong_weight).as Int]]
        puts (node_weight + right_weight - wrong_weight)
    end

    return { total_weight, this_balanced }
end

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
parent = (tree_hash.keys - have_parent)[0]
balance_data(tree_hash, weight_hash, parent)
