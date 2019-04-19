# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum_1(nums, target)
  (0...nums.count).each do |i|
      (i + 1...nums.count).each do |j|
          puts(nums[i], nums[j])
          return [i, j] if nums[i] + nums[j] == target
      end
  end
end

# 48ms 10.2MB
def two_sum_2(nums, target)
  sum_map = {}

  nums.each_with_index do |num, index|
    return [sum_map[num], index] if sum_map[num]
    need_num = target - num
    sum_map[need_num] = index
  end
end

# 36ms 100%
def two_sum(nums, target)
  sum_map = {}

  nums.each_with_index do |num, index|
    return [sum_map[num], index] if sum_map[num]
    sum_map[target - num] = index
  end
end

p two_sum([3, 2, 7, 1, 5], 6)
