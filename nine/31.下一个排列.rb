#
# @lc app=leetcode.cn id=31 lang=ruby
#
# [31] 下一个排列
#
# https://leetcode-cn.com/problems/next-permutation/description/
#
# algorithms
# Medium (36.53%)
# Likes:    1023
# Dislikes: 0
# Total Accepted:    148.4K
# Total Submissions: 405.3K
# Testcase Example:  '[1,2,3]'
#
# 实现获取 下一个排列 的函数，算法需要将给定数字序列重新排列成字典序中下一个更大的排列。
#
# 如果不存在下一个更大的排列，则将数字重新排列成最小的排列（即升序排列）。
#
# 必须 原地 修改，只允许使用额外常数空间。
#
#
#
# 示例 1：
#
#
# 输入：nums = [1,2,3]
# 输出：[1,3,2]
#
#
# 示例 2：
#
#
# 输入：nums = [3,2,1]
# 输出：[1,2,3]
#
#
# 示例 3：
#
#
# 输入：nums = [1,1,5]
# 输出：[1,5,1]
#
#
# 示例 4：
#
#
# 输入：nums = [1]
# 输出：[1]
#
#
#
#
# 提示：
#
#
# 1
# 0
#
#
#

# @lc code=start
# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def next_permutation(nums)
  miner = -1

  (nums.size - 1).downto(1) do |i|
    if nums[i - 1] < nums[i]
      miner = i - 1
      break
    end
  end

  return nums.reverse! if miner == -1

  maxer = nums.size

  (nums.size - 1).downto(miner + 1) do |i|
    if nums[i] > nums[miner]
      maxer = i
      break
    end
  end

  nums[miner], nums[maxer] = nums[maxer], nums[miner]

  i = miner + 1
  j = nums.size - 1

  until i >= j
    nums[i], nums[j] = nums[j], nums[i]
    i += 1
    j -= 1
  end
end
# @lc code=end

p next_permutation([3, 2, 1])

