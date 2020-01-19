#
# @lc app=leetcode.cn id=581 lang=ruby
#
# [581] 最短无序连续子数组
#
# https://leetcode-cn.com/problems/shortest-unsorted-continuous-subarray/description/
#
# algorithms
# Easy (33.33%)
# Likes:    206
# Dislikes: 0
# Total Accepted:    15.5K
# Total Submissions: 46.2K
# Testcase Example:  '[2,6,4,8,10,9,15]'
#
# 给定一个整数数组，你需要寻找一个连续的子数组，如果对这个子数组进行升序排序，那么整个数组都会变为升序排序。
#
# 你找到的子数组应是最短的，请输出它的长度。
#
# 示例 1:
#
#
# 输入: [2, 6, 4, 8, 10, 9, 15]
# 输出: 5
# 解释: 你只需要对 [6, 4, 8, 10, 9] 进行升序排序，那么整个表都会变为升序排序。
#
#
# 说明 :
#
#
# 输入的数组长度范围在 [1, 10,000]。
# 输入的数组可能包含重复元素 ，所以升序的意思是<=。
#
#
#

# @lc code=start
# @param {Integer[]} nums
# @return {Integer}
def find_unsorted_subarray(nums)
    sort_nums = nums.sort
    head = tail = 0
    find_head = false

    nums.size.times do |index|
        if nums[index] != sort_nums[index]
            if find_head == false
                head = index
                find_head = true
            else
                tail = index
            end
        end
    end

    return find_head ? tail - head + 1 : 0
end
# @lc code=end

=begin
O(logn) 的方案，排序后查看不一致的元素，但是需要注意已经正序的情况
=end

