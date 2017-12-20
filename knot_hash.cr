def knot_hash(bytes)
    lengths = bytes + [17, 31, 73, 47, 23]
    nums = Array.new(256) { |it| it }
    rotated_by = 0
    (64 * lengths.size).times do |time|
        index = time % lengths.size
        if lengths[index] > 0
            nums = nums[0..lengths[index] - 1].reverse + nums[lengths[index]..nums.size]
        end
        rotate_by = time + lengths[index]
        rotated_by += rotate_by
        nums.rotate! rotate_by
    end
    nums.rotate! -rotated_by
    return nums.each_slice(16).map do |list|
        list.reduce(0) { |a, b| a^b }.to_s(16).rjust(2, '0')
    end.join("")
end
