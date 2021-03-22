#
# @lc app=leetcode.cn id=15 lang=ruby
#
# [15] 三数之和
#
# https://leetcode-cn.com/problems/3sum/description/
#
# algorithms
# Medium (31.28%)
# Likes:    3123
# Dislikes: 0
# Total Accepted:    456.4K
# Total Submissions: 1.5M
# Testcase Example:  '[-1,0,1,2,-1,-4]'
#
# 给你一个包含 n 个整数的数组 nums，判断 nums 中是否存在三个元素 a，b，c ，使得 a + b + c = 0 ？请你找出所有和为 0
# 且不重复的三元组。
#
# 注意：答案中不可以包含重复的三元组。
#
#
#
# 示例 1：
#
#
# 输入：nums = [-1,0,1,2,-1,-4]
# 输出：[[-1,-1,2],[-1,0,1]]
#
#
# 示例 2：
#
#
# 输入：nums = []
# 输出：[]
#
#
# 示例 3：
#
#
# 输入：nums = [0]
# 输出：[]
#
#
#
#
# 提示：
#
#
# 0
# -10^5
#
#
#

# @lc code=start
# @param {Integer[]} nums
# @return {Integer[][]}
def three_sum(nums)
  return [] if nums.size < 3

  res = []
  nums.sort!

  nums.each_with_index do |num, index|
    # 对于排序的数组来说，可以使用该方法来去重
    next if index > 0 && num == nums[index - 1]

    l = index + 1
    r = nums.size - 1

    until l >= r
      if nums[l] + nums[r] > -num
        r -= 1
      elsif nums[l] + nums[r] < -num
        l += 1
      else
        if l > index + 1 && nums[l] == nums[l - 1]
          l += 1
          next
        end

        if r < nums.size - 1 && nums[r] == nums[r + 1]
          r -= 1
          next
        end

        res << [num, nums[l], nums[r]]
        l += 1
        r -= 1
      end
    end
  end

  res
end
# @lc code=end

p three_sum([-1,0,1,2,-1,-4])
p three_sum([0,0,0,0])


