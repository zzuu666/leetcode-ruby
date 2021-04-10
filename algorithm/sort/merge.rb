

module Sort
  def self.merge(left, right)
    sorted = []

    until left.empty? || right.empty?
      left.first <= right.first ? sorted << left.shift : sorted << right.shift
    end

    sorted + left + right
  end

  def self.merge_sort(nums)
    return nums if nums.size <= 1

    mid = nums.size / 2
    left = nums[0...mid]
    right = nums[mid...nums.size]
    merge(merge_sort(left), merge_sort(right))
  end
end

p Sort.merge_sort([5, 4, 3, 2, 1])
