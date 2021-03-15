#
# @lc app=leetcode.cn id=279 lang=ruby
#
# [279] 完全平方数
#
# https://leetcode-cn.com/problems/perfect-squares/description/
#
# algorithms
# Medium (59.54%)
# Likes:    795
# Dislikes: 0
# Total Accepted:    117.5K
# Total Submissions: 197.2K
# Testcase Example:  '12'
#
# 给定正整数 n，找到若干个完全平方数（比如 1, 4, 9, 16, ...）使得它们的和等于 n。你需要让组成和的完全平方数的个数最少。
#
# 给你一个整数 n ，返回和为 n 的完全平方数的 最少数量 。
#
# 完全平方数 是一个整数，其值等于另一个整数的平方；换句话说，其值等于一个整数自乘的积。例如，1、4、9 和 16 都是完全平方数，而 3 和 11
# 不是。
#
#
#
# 示例 1：
#
#
# 输入：n = 12
# 输出：3
# 解释：12 = 4 + 4 + 4
#
# 示例 2：
#
#
# 输入：n = 13
# 输出：2
# 解释：13 = 4 + 9
#
#
# 提示：
#
#
# 1
#
#
#

# @lc code=start
require 'set'

@prefect_squares = (1..100).each do |index|
  (index + 1) ** 2
end

# @param {Integer} n
# @return {Integer}
def num_squares(n)
  res = 0
  queue = Queue.new
  set = Set.new

  @prefect_squares.each do |number|
    # 如果 number 已经比 n 大了就不需要在往队列里塞了
    break if number > n

    queue << number
    set << number
  end

  until queue.empty?
    res += 1
    queue.size.times do
      current = queue.pop
      return res if current == n

      @prefect_squares.each do |number|
        next_number = number + current

        break if next_number > n
        # 如果已经出现过了就跳过这个数
        # 因为要么出现在同级，要么出现在下一级
        # 如果出现在下一级必然没有前一级的结果更小一些
        next if set.include?(next_number)

        queue << next_number
        set << next_number
      end
    end
  end

  res
end
# @lc code=end
p num_squares(8278)

# TAG: BFS

=begin
先把 1..100 的完全平方数给列出来

=end
