lengths = File.read("day10.txt").chomp.split(",").map &.to_i
nums = Array.new(256) { |it| it }
rotated_by = 0
lengths.size.times do |index|
    if lengths[index] > 0
        nums = nums[0..lengths[index] - 1].reverse + nums[lengths[index]..nums.size]
    end
    rotate_by = index + lengths[index]
    rotated_by += rotate_by
    nums.rotate! rotate_by
end
nums.rotate! -rotated_by
puts nums[0] * nums[1]
