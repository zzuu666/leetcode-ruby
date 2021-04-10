module Sort
  def self.partition(nums, left, right)
    benchmark = nums[right]
    low = left - 1

    left.upto(right - 1) do |index|
      if nums[index] <= benchmark
        low += 1
        nums[low], nums[index] = nums[index], nums[low]
      end
    end

    nums[low + 1], nums[right] = nums[right], nums[low + 1]

    low + 1
  end

  def self.quick_sort(nums, left = 0, right = nums.size - 1)
    return unless left < right
    mid = partition(nums, left, right)
    quick_sort(nums, left, mid - 1)
    quick_sort(nums, mid + 1, right)
    nums
  end
end

p Sort.quick_sort([6, 8, 9, 10, 3, 2, 5, 8, 10])
