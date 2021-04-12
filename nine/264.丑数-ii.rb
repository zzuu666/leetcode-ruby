#
# @lc app=leetcode.cn id=264 lang=ruby
#
# [264] 丑数 II
#
# https://leetcode-cn.com/problems/ugly-number-ii/description/
#
# algorithms
# Medium (55.38%)
# Likes:    629
# Dislikes: 0
# Total Accepted:    75.9K
# Total Submissions: 133.8K
# Testcase Example:  '10'
#
# 给你一个整数 n ，请你找出并返回第 n 个 丑数 。
#
# 丑数 就是只包含质因数 2、3 和/或 5 的正整数。
#
#
#
# 示例 1：
#
#
# 输入：n = 10
# 输出：12
# 解释：[1, 2, 3, 4, 5, 6, 8, 9, 10, 12] 是由前 10 个丑数组成的序列。
#
#
# 示例 2：
#
#
# 输入：n = 1
# 输出：1
# 解释：1 通常被视为丑数。
#
#
#
#
# 提示：
#
#
# 1
#
#
#

# @lc code=start
# @param {Integer} n
# @return {Integer}
def nth_ugly_number(n)
  dp = [0 , 1]
  d2, d3, d5 = 1, 1, 1

  2.upto(n) do |i|
    n2 = dp[d2] * 2
    n3 = dp[d3] * 3
    n5 = dp[d5] * 5
    dp[i] = [n2, n3, n5].min

    d2 += 1 if dp[i] == n2
    d3 += 1 if dp[i] == n3
    d5 += 1 if dp[i] == n5
  end

  dp[n]
end
# @lc code=end

p nth_ugly_number(10)
