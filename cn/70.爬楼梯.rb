#
# @lc app=leetcode.cn id=70 lang=ruby
#
# [70] 爬楼梯
#
# https://leetcode-cn.com/problems/climbing-stairs/description/
#
# algorithms
# Easy (47.46%)
# Likes:    788
# Dislikes: 0
# Total Accepted:    121.3K
# Total Submissions: 255.2K
# Testcase Example:  '2'
#
# 假设你正在爬楼梯。需要 n 阶你才能到达楼顶。
#
# 每次你可以爬 1 或 2 个台阶。你有多少种不同的方法可以爬到楼顶呢？
#
# 注意：给定 n 是一个正整数。
#
# 示例 1：
#
# 输入： 2
# 输出： 2
# 解释： 有两种方法可以爬到楼顶。
# 1.  1 阶 + 1 阶
# 2.  2 阶
#
# 示例 2：
#
# 输入： 3
# 输出： 3
# 解释： 有三种方法可以爬到楼顶。
# 1.  1 阶 + 1 阶 + 1 阶
# 2.  1 阶 + 2 阶
# 3.  2 阶 + 1 阶
#
#
#

# @lc code=start
# @param {Integer} n
# @return {Integer}
def climb_stairs(n)
    @dp_map = [0, 1, 2]

    def dp (step)
        return @dp_map[step] if @dp_map[step] != nil
        @dp_map[step] = dp(step - 2) + dp(step - 1)
        @dp_map[step]
    end

    dp(n)
end
# @lc code=end

# 记忆化 DP 但是我的递归 DP 写的很丑陋

