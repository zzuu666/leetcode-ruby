#
# @lc app=leetcode.cn id=53 lang=ruby
#
# [53] 最大子序和
#
# https://leetcode-cn.com/problems/maximum-subarray/description/
#
# algorithms
# Easy (48.52%)
# Likes:    1489
# Dislikes: 0
# Total Accepted:    143.3K
# Total Submissions: 294.7K
# Testcase Example:  '[-2,1,-3,4,-1,2,1,-5,4]'
#
# 给定一个整数数组 nums ，找到一个具有最大和的连续子数组（子数组最少包含一个元素），返回其最大和。
#
# 示例:
#
# 输入: [-2,1,-3,4,-1,2,1,-5,4],
# 输出: 6
# 解释: 连续子数组 [4,-1,2,1] 的和最大，为 6。
#
#
# 进阶:
#
# 如果你已经实现复杂度为 O(n) 的解法，尝试使用更为精妙的分治法求解。
#
#

# @lc code=start
# @param {Integer[]} nums
# @return {Integer}
def max_sub_array(nums)
    # return 0 if nums.empty?

    # res = nums[0]
    # current = nums[0]
    # (nums.size - 1).times do |i|
    #     num = nums[i + 1]

    #     if num > 0
    #         current = 0 if current < 0
    #         current += num
    #         res = [current, res].max
    #     else
    #         current += num
    #         # avoid [-5, -3, -2]
    #         res = [num, res].max
    #     end
    # end

    res = cur = nums[0]

    (nums.size - 1).times do |i|
        num = nums[i + 1]
        cur = [num, cur + num].max
        res = [res, cur].max
    end

    res
end
# @lc code=end

=begin
第一次的解法，学名叫贪心。一个记录当前累加的最大值，一个记录当前最大值（即结果）。

core: 每一步都选择最优的结果，那么全局的结果就会是最优的

res = cur = nums[0]

(nums.size - 1).times do |i|
    num = nums[i + 1]
    # 精髓就在这一句，cur 即当前累加时段的记录值
    # cur 即如果在这加上这个数字还不如这个数字大了，就以当前的数字为开始
    cur = [num, cur + num].max
    res = [res, cur].max
end

=end

