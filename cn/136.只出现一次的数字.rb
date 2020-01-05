#
# @lc app=leetcode.cn id=136 lang=ruby
#
# [136] 只出现一次的数字
#
# https://leetcode-cn.com/problems/single-number/description/
#
# algorithms
# Easy (64.62%)
# Likes:    975
# Dislikes: 0
# Total Accepted:    134.3K
# Total Submissions: 207.8K
# Testcase Example:  '[2,2,1]'
#
# 给定一个非空整数数组，除了某个元素只出现一次以外，其余每个元素均出现两次。找出那个只出现了一次的元素。
#
# 说明：
#
# 你的算法应该具有线性时间复杂度。 你可以不使用额外空间来实现吗？
#
# 示例 1:
#
# 输入: [2,2,1]
# 输出: 1
#
#
# 示例 2:
#
# 输入: [4,1,2,1,2]
# 输出: 4
#
#

# @lc code=start
# @param {Integer[]} nums
# @return {Integer}
def single_number(nums)
    nums.reduce(0) { |res, num| res ^ num }
end
# @lc code=end

# 不知道为什么时间击败的人很少，但是这样写起来很爽

# 位运算问题 0 ^ x = x,  x ^ x = 0

