#
# @lc app=leetcode.cn id=34 lang=ruby
#
# [34] 在排序数组中查找元素的第一个和最后一个位置
#
# https://leetcode-cn.com/problems/find-first-and-last-position-of-element-in-sorted-array/description/
#
# algorithms
# Medium (42.30%)
# Likes:    944
# Dislikes: 0
# Total Accepted:    235K
# Total Submissions: 554.4K
# Testcase Example:  '[5,7,7,8,8,10]\n8'
#
# 给定一个按照升序排列的整数数组 nums，和一个目标值 target。找出给定目标值在数组中的开始位置和结束位置。
#
# 如果数组中不存在目标值 target，返回 [-1, -1]。
#
# 进阶：
#
#
# 你可以设计并实现时间复杂度为 O(log n) 的算法解决此问题吗？
#
#
#
#
# 示例 1：
#
#
# 输入：nums = [5,7,7,8,8,10], target = 8
# 输出：[3,4]
#
# 示例 2：
#
#
# 输入：nums = [5,7,7,8,8,10], target = 6
# 输出：[-1,-1]
#
# 示例 3：
#
#
# 输入：nums = [], target = 0
# 输出：[-1,-1]
#
#
#
# 提示：
#
#
# 0
# -10^9 
# nums 是一个非递减数组
# -10^9 
#
#
#

# @lc code=start
def search(nums, target, fm)
  l = 0
  r = nums.size - 1
  res = fm ? nums.size : -1

  while l <= r
    mid = (l + r) / 2
    if target == nums[mid]
      res = fm ? [mid, res].min : [mid, res].max
      if fm
        r = mid - 1
      else
        l = mid + 1
      end
      next
    end

    if nums[mid] > target
      r = mid - 1
    else
      l = mid + 1
    end
  end

  return res == nums.size ? -1 : res
end
# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def search_range(nums, target)
  [search(nums, target, true), search(nums, target, false)]
end
# @lc code=end
