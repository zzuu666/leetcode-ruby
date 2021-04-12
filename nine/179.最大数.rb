#
# @lc app=leetcode.cn id=179 lang=ruby
#
# [179] 最大数
#
# https://leetcode-cn.com/problems/largest-number/description/
#
# algorithms
# Medium (38.04%)
# Likes:    658
# Dislikes: 0
# Total Accepted:    89.8K
# Total Submissions: 223.4K
# Testcase Example:  '[10,2]'
#
# 给定一组非负整数 nums，重新排列每个数的顺序（每个数不可拆分）使之组成一个最大的整数。
#
# 注意：输出结果可能非常大，所以你需要返回一个字符串而不是整数。
#
#
#
# 示例 1：
#
#
# 输入：nums = [10,2]
# 输出："210"
#
# 示例 2：
#
#
# 输入：nums = [3,30,34,5,9]
# 输出："9534330"
#
#
# 示例 3：
#
#
# 输入：nums = [1]
# 输出："1"
#
#
# 示例 4：
#
#
# 输入：nums = [10]
# 输出："10"
#
#
#
#
# 提示：
#
#
# 1
# 0
#
#
#

# @lc code=start
# @param {Integer[]} nums
# @return {String}
def largest_number(nums)
  str_nums = nums.map(&:to_s)
  str_nums.sort! { |a, b| -(a + b <=> b + a) }
  res = str_nums.join
  # 存在 case [0, 0, 0, 0]
  # 这时候应该返回 '0' 而不是 '0000'
  res[0] == '0' ? '0' : res
end
# @lc code=end

=begin
数学问题，只要保证每两个之间数字典序组合后的结果最大
就可以保证整个数组返回的字典序最大，记住就好了
=end
