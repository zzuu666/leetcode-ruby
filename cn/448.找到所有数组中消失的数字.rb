#
# @lc app=leetcode.cn id=448 lang=ruby
#
# [448] 找到所有数组中消失的数字
#
# https://leetcode-cn.com/problems/find-all-numbers-disappeared-in-an-array/description/
#
# algorithms
# Easy (54.88%)
# Likes:    253
# Dislikes: 0
# Total Accepted:    22.3K
# Total Submissions: 40.4K
# Testcase Example:  '[4,3,2,7,8,2,3,1]'
#
# 给定一个范围在  1 ≤ a[i] ≤ n ( n = 数组大小 ) 的 整型数组，数组中的元素一些出现了两次，另一些只出现一次。
#
# 找到所有在 [1, n] 范围之间没有出现在数组中的数字。
#
# 您能在不使用额外空间且时间复杂度为O(n)的情况下完成这个任务吗? 你可以假定返回的数组不算在额外空间内。
#
# 示例:
#
#
# 输入:
# [4,3,2,7,8,2,3,1]
#
# 输出:
# [5,6]
#
#
#

# @lc code=start
# @param {Integer[]} nums
# @return {Integer[]}
def find_disappeared_numbers(nums)
    res = []
    nums.size.times do |i|
        # 数字范围 1 <= a[i] <= n
        pos = (nums[i].abs) - 1

        nums[pos] = nums[pos] > 0 ? -nums[pos] : nums[pos]
    end

    nums.size.times do |i|
        # 如果原数组中的未标记为负数的话说明这个[下标 - 1]的数字未出现
        res << i + 1 if nums[i] > 0
    end

    res
end
# @lc code=end

# 没有题目限制的话这个题就是送分题


