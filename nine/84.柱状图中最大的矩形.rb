#
# @lc app=leetcode.cn id=84 lang=ruby
#
# [84] 柱状图中最大的矩形
#
# https://leetcode-cn.com/problems/largest-rectangle-in-histogram/description/
#
# algorithms
# Hard (42.88%)
# Likes:    1241
# Dislikes: 0
# Total Accepted:    130.9K
# Total Submissions: 305.3K
# Testcase Example:  '[2,1,5,6,2,3]'
#
# 给定 n 个非负整数，用来表示柱状图中各个柱子的高度。每个柱子彼此相邻，且宽度为 1 。
#
# 求在该柱状图中，能够勾勒出来的矩形的最大面积。
#
#
#
#
#
# 以上是柱状图的示例，其中每个柱子的宽度为 1，给定的高度为 [2,1,5,6,2,3]。
#
#
#
#
#
# 图中阴影部分为所能勾勒出的最大矩形面积，其面积为 10 个单位。
#
#
#
# 示例:
#
# 输入: [2,1,5,6,2,3]
# 输出: 10
#
#

# @lc code=start
# @param {Integer[]} heights
# @return {Integer}
def largest_rectangle_area(heights)
  # 单调栈自底至顶递增
  stack = []

  res = 0

  # 传入一个最小的值保证最后的时候可以把之前的全部出栈
  limited_heights = [0] + heights + [0]

  limited_heights.each_with_index do |h, i|
    # 栈空或者能够维持单调栈的特性则直接入栈
    until stack.empty? || h >= limited_heights[stack.last]
      current = stack.pop
      size = (i - stack.last - 1) * limited_heights[current]
      res = [res, size].max
    end
    stack << i
  end

  res
end
# @lc code=end


p largest_rectangle_area([7, 7, 7, 7, 7])
