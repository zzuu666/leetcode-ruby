#
# @lc app=leetcode.cn id=78 lang=ruby
#
# [78] 子集
#
# https://leetcode-cn.com/problems/subsets/description/
#
# algorithms
# Medium (79.63%)
# Likes:    1086
# Dislikes: 0
# Total Accepted:    218.8K
# Total Submissions: 275K
# Testcase Example:  '[1,2,3]'
#
# 给你一个整数数组 nums ，数组中的元素 互不相同 。返回该数组所有可能的子集（幂集）。
#
# 解集 不能 包含重复的子集。你可以按 任意顺序 返回解集。
#
#
#
# 示例 1：
#
#
# 输入：nums = [1,2,3]
# 输出：[[],[1],[2],[1,2],[3],[1,3],[2,3],[1,2,3]]
#
#
# 示例 2：
#
#
# 输入：nums = [0]
# 输出：[[],[0]]
#
#
#
#
# 提示：
#
#
# 1
# -10
# nums 中的所有元素 互不相同
#
#
#

# @lc code=start
def backtrack(nums, depth, stack, res)
  if nums.size == depth
    res << stack.dup
    return
  end

  current_num = nums[depth]
  # 不选
  backtrack(nums, depth + 1, stack, res)
  # 选
  stack << current_num
  backtrack(nums, depth + 1, stack, res)
  # 重置状态
  stack.pop
end

# @param {Integer[]} nums
# @return {Integer[][]}
def subsets(nums)
  res = []
  stack = []

  backtrack(nums, 0, stack, res)

  res
end
# @lc code=end

=begin
对于子集问题第一要义就是有 n 个数，要么选择要么不选
函数 backtrack 中的 depth 为
=end
