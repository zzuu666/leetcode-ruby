#
# @lc app=leetcode.cn id=153 lang=ruby
#
# [153] 寻找旋转排序数组中的最小值
#
# https://leetcode-cn.com/problems/find-minimum-in-rotated-sorted-array/description/
#
# algorithms
# Medium (52.44%)
# Likes:    387
# Dislikes: 0
# Total Accepted:    119.3K
# Total Submissions: 226.2K
# Testcase Example:  '[3,4,5,1,2]'
#
# 已知一个长度为 n 的数组，预先按照升序排列，经由 1 到 n 次 旋转 后，得到输入数组。例如，原数组 nums = [0,1,2,4,5,6,7]
# 在变化后可能得到：
#
# 若旋转 4 次，则可以得到 [4,5,6,7,0,1,2]
# 若旋转 4 次，则可以得到 [0,1,2,4,5,6,7]
#
#
# 注意，数组 [a[0], a[1], a[2], ..., a[n-1]] 旋转一次 的结果为数组 [a[n-1], a[0], a[1], a[2],
# ..., a[n-2]] 。
#
# 给你一个元素值 互不相同 的数组 nums ，它原来是一个升序排列的数组，并按上述情形进行了多次旋转。请你找出并返回数组中的 最小元素 。
#
#
#
# 示例 1：
#
#
# 输入：nums = [3,4,5,1,2]
# 输出：1
# 解释：原数组为 [1,2,3,4,5] ，旋转 3 次得到输入数组。
#
#
# 示例 2：
#
#
# 输入：nums = [4,5,6,7,0,1,2]
# 输出：0
# 解释：原数组为 [0,1,2,4,5,6,7] ，旋转 4 次得到输入数组。
#
#
# 示例 3：
#
#
# 输入：nums = [11,13,15,17]
# 输出：11
# 解释：原数组为 [11,13,15,17] ，旋转 4 次得到输入数组。
#
#
#
#
# 提示：
#
#
# n == nums.length
# 1
# -5000
# nums 中的所有整数 互不相同
# nums 原来是一个升序排序的数组，并进行了 1 至 n 次旋转
#
#
#

# @lc code=start
# @param {Integer[]} nums
# @return {Integer}
def find_min(nums)
  l = 0
  r = nums.size - 1
  # 当 l == r 的时候则说明已经寻找到最小值了
  until l == r
    m = (l + r) / 2
    # 如果 m 值 < r 值时说明 m 落在了最小到 r 的区间
    if nums[m] < nums[r]
      r = m
    else
      # 落在左侧需要 + 1 否则会出现 死循环
      # 因为左侧区域 + 1 后必然不会将最小值排除所以可以 + 1
      l = m + 1
    end
  end

  nums[l]
end
# @lc code=end

