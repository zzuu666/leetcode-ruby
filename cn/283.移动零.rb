#
# @lc app=leetcode.cn id=283 lang=ruby
#
# [283] 移动零
#
# https://leetcode-cn.com/problems/move-zeroes/description/
#
# algorithms
# Easy (58.53%)
# Likes:    464
# Dislikes: 0
# Total Accepted:    95.3K
# Total Submissions: 162.8K
# Testcase Example:  '[0,1,0,3,12]'
#
# 给定一个数组 nums，编写一个函数将所有 0 移动到数组的末尾，同时保持非零元素的相对顺序。
#
# 示例:
#
# 输入: [0,1,0,3,12]
# 输出: [1,3,12,0,0]
#
# 说明:
#
#
# 必须在原数组上操作，不能拷贝额外的数组。
# 尽量减少操作次数。
#
#
#

# @lc code=start
# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def move_zeroes(nums)
    nums.size.times do |i|
        if nums[i] == 0
            nx_no = -1
            (i + 1).upto(nums.size - 1) do |j|
                if nums[j] != 0
                    nx_no = j
                    break
                end
            end

            return if nx_no == -1

            temp = nums[i]
            nums[i] = nums[nx_no]
            nums[nx_no] = temp
        end
    end
end
# @lc code=end


# O(n^2) 的解题方案，遇到 0 的话则寻找后面一个不为 0 的数字和他交换
