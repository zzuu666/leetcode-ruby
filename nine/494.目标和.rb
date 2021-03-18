#
# @lc app=leetcode.cn id=494 lang=ruby
#
# [494] 目标和
#
# https://leetcode-cn.com/problems/target-sum/description/
#
# algorithms
# Medium (44.89%)
# Likes:    591
# Dislikes: 0
# Total Accepted:    69.7K
# Total Submissions: 155K
# Testcase Example:  '[1,1,1,1,1]\n3'
#
# 给定一个非负整数数组，a1, a2, ..., an, 和一个目标数，S。现在你有两个符号 + 和 -。对于数组中的任意一个整数，你都可以从 + 或
# -中选择一个符号添加在前面。
#
# 返回可以使最终数组和为目标数 S 的所有添加符号的方法数。
#
#
#
# 示例：
#
# 输入：nums: [1, 1, 1, 1, 1], S: 3
# 输出：5
# 解释：
#
# -1+1+1+1+1 = 3
# +1-1+1+1+1 = 3
# +1+1-1+1+1 = 3
# +1+1+1-1+1 = 3
# +1+1+1+1-1 = 3
#
# 一共有5种方法让最终目标和为3。
#
#
#
#
# 提示：
#
#
# 数组非空，且长度不会超过 20 。
# 初始的数组的和不会超过 1000 。
# 保证返回的最终结果能被 32 位整数存下。
#
#
#

# @lc code=start
# @param {Integer[]} nums
# @param {Integer} s
# @return {Integer}
def find_target_sum_ways(nums, s)
  # dp[i][j] 表示前 i 个数字的和为 j 的可能性
  dp = Array.new(20){Array.new(2001, 0)}

  dp[0][nums[0] + 1000] = 1
  # 这里用 += 存在 0 的 case
  dp[0][-nums[0] + 1000] += 1

  (1...nums.size).each do |i|
    2001.times do |j|
      next if dp[i - 1][j] == 0
      dp[i][j + nums[i]] += dp[i - 1][j]
      dp[i][j - nums[i]] += dp[i - 1][j]
    end
  end

  return s > 1000 ? 0 : dp[nums.size - 1][s + 1000]

end
# @lc code=end

p find_target_sum_ways([1, 1, 1, 1, 1], 3)

# TAG: DP
# NEED_REVIEW

=begin
dfs 的解法会超时

def dfs(nums, s, sum, step)
  if step == nums.size
    return sum == s ? 1 : 0
  end

  n = nums[step]

  dfs(nums, s, sum + n, step + 1) + dfs(nums, s, sum - n, step + 1)
end

def find_target_sum_ways(nums, s)
  dfs(nums, s, 0, 0)
end

=end

