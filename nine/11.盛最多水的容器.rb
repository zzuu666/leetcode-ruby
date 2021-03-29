#
# @lc app=leetcode.cn id=11 lang=ruby
#
# [11] 盛最多水的容器
#
# https://leetcode-cn.com/problems/container-with-most-water/description/
#
# algorithms
# Medium (64.71%)
# Likes:    2315
# Dislikes: 0
# Total Accepted:    401.8K
# Total Submissions: 622.7K
# Testcase Example:  '[1,8,6,2,5,4,8,3,7]'
#
# 给你 n 个非负整数 a1，a2，...，an，每个数代表坐标中的一个点 (i, ai) 。在坐标内画 n 条垂直线，垂直线 i 的两个端点分别为 (i,
# ai) 和 (i, 0) 。找出其中的两条线，使得它们与 x 轴共同构成的容器可以容纳最多的水。
#
# 说明：你不能倾斜容器。
#
#
#
# 示例 1：
#
#
#
#
# 输入：[1,8,6,2,5,4,8,3,7]
# 输出：49
# 解释：图中垂直线代表输入数组 [1,8,6,2,5,4,8,3,7]。在此情况下，容器能够容纳水（表示为蓝色部分）的最大值为 49。
#
# 示例 2：
#
#
# 输入：height = [1,1]
# 输出：1
#
#
# 示例 3：
#
#
# 输入：height = [4,3,2,1,4]
# 输出：16
#
#
# 示例 4：
#
#
# 输入：height = [1,2,1]
# 输出：2
#
#
#
#
# 提示：
#
#
# n = height.length
# 2
# 0
#
#
#

# @lc code=start
# @param {Integer[]} height
# @return {Integer}
def max_area(height)
  i = 0
  j = height.size - 1
  res = -1

  while i < j
    low = height[i] < height[j] ? i : j
    v = height[low] * (j - i)
    res = [res, v].max
    if low == i
      i += 1
    else
      j -= 1
    end
  end

  res
end
# @lc code=end

=begin
这道题和容易可以想到暴力两个 for
看了题解之后确实双指针是有道理的

每次移动较低的那一端，不断的缩小距离
=end

