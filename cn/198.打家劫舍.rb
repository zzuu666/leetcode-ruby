#
# @lc app=leetcode.cn id=198 lang=ruby
#
# [198] 打家劫舍
#
# https://leetcode-cn.com/problems/house-robber/description/
#
# algorithms
# Easy (42.36%)
# Likes:    607
# Dislikes: 0
# Total Accepted:    67K
# Total Submissions: 157.8K
# Testcase Example:  '[1,2,3,1]'
#
#
# 你是一个专业的小偷，计划偷窃沿街的房屋。每间房内都藏有一定的现金，影响你偷窃的唯一制约因素就是相邻的房屋装有相互连通的防盗系统，如果两间相邻的房屋在同一晚上被小偷闯入，系统会自动报警。
#
# 给定一个代表每个房屋存放金额的非负整数数组，计算你在不触动警报装置的情况下，能够偷窃到的最高金额。
#
# 示例 1:
#
# 输入: [1,2,3,1]
# 输出: 4
# 解释: 偷窃 1 号房屋 (金额 = 1) ，然后偷窃 3 号房屋 (金额 = 3)。
# 偷窃到的最高金额 = 1 + 3 = 4 。
#
# 示例 2:
#
# 输入: [2,7,9,3,1]
# 输出: 12
# 解释: 偷窃 1 号房屋 (金额 = 2), 偷窃 3 号房屋 (金额 = 9)，接着偷窃 5 号房屋 (金额 = 1)。
# 偷窃到的最高金额 = 2 + 9 + 1 = 12 。
#
#
#

# @lc code=start
# @param {Integer[]} nums
# @return {Integer}
def rob(nums)
    prevMax = curMax = 0

    nums.each do |num|
        temp = curMax
        curMax = [prevMax + num, curMax].max
        prevMax = temp
    end

    curMax
end
# @lc code=end

=begin
动态规划问题
面对一间屋子，要么偷要么不偷，偷的话就是 f(n - 2) + nums[n] 不偷就是 f(n - 1)
那么 f(n) =  [f(n - 2) + nums[n], f(n - 1)].max

题解中的写法 prevMax 总是在记录 f(n - 2) 的值  curMax 则是在记录 f(n - 1) 的值

循环体内 temp = n - 1 记录 n - 1
curMax = n
prevMax = n - 1
=end
