#
# @lc app=leetcode.cn id=55 lang=ruby
#
# [55] 跳跃游戏
#
# https://leetcode-cn.com/problems/jump-game/description/
#
# algorithms
# Medium (41.83%)
# Likes:    1132
# Dislikes: 0
# Total Accepted:    218.9K
# Total Submissions: 522K
# Testcase Example:  '[2,3,1,1,4]'
#
# 给定一个非负整数数组 nums ，你最初位于数组的 第一个下标 。
#
# 数组中的每个元素代表你在该位置可以跳跃的最大长度。
#
# 判断你是否能够到达最后一个下标。
#
#
#
# 示例 1：
#
#
# 输入：nums = [2,3,1,1,4]
# 输出：true
# 解释：可以先跳 1 步，从下标 0 到达下标 1, 然后再从下标 1 跳 3 步到达最后一个下标。
#
#
# 示例 2：
#
#
# 输入：nums = [3,2,1,0,4]
# 输出：false
# 解释：无论怎样，总会到达下标为 3 的位置。但该下标的最大跳跃长度是 0 ， 所以永远不可能到达最后一个下标。
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
# @return {Boolean}
def can_jump(nums)
  # 能够到达的最远的地方
  can_arrive = 0
  nums.size.times do |i|
    # 如果当前坐标在不可到达的地方了，就可定到不到最后
    return false if i > can_arrive

    # 当前位置加上偏移量
    can_arrive = [i + nums[i], can_arrive].max

    # 能够到达最远的地方比最后一个元素的下标大就可以满足题意了
    return true if can_arrive >= nums.size - 1
  end
end
# @lc code=end

p can_jump([3,2,1,0,4])

# Time limit
require 'set'

def can_jump_bfs(nums)
  return false if nums.empty?

  queue = Queue.new
  visited = Set.new

  queue << 0
  visited << 0

  until queue.empty?
    cur = queue.pop
    return true if cur >= nums.size - 1


    next_len = nums[cur]
    next_len.downto(1) do |i|
      pos = i + cur
      next if visited.include?(pos)

      queue << pos
      visited << pos
    end
  end

  false
end

