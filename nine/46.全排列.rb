#
# @lc app=leetcode.cn id=46 lang=ruby
#
# [46] 全排列
#
# https://leetcode-cn.com/problems/permutations/description/
#
# algorithms
# Medium (77.71%)
# Likes:    1253
# Dislikes: 0
# Total Accepted:    286.9K
# Total Submissions: 368.8K
# Testcase Example:  '[1,2,3]'
#
# 给定一个 没有重复 数字的序列，返回其所有可能的全排列。
#
# 示例:
#
# 输入: [1,2,3]
# 输出:
# [
# ⁠ [1,2,3],
# ⁠ [1,3,2],
# ⁠ [2,1,3],
# ⁠ [2,3,1],
# ⁠ [3,1,2],
# ⁠ [3,2,1]
# ]
#
#

# @lc code=start
require 'set'
def dfs(nums, visited, path, depth, res)
  if depth == nums.size
    res << path.dup
    return
  end

  nums.each do |num|
    next if visited.include?(num)

    path << num
    visited << num
    dfs(nums, visited, path, depth + 1, res)
    path.pop
    visited.delete num
  end
end
# @param {Integer[]} nums
# @return {Integer[][]}
def permute(nums)
  return [] if nums.empty?

  visited = Set.new
  res = []

  dfs(nums, visited, [], 0, res)
  res
end
# @lc code=end

p permute([6,2,-1,8])
