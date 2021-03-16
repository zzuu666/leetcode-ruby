#
# @lc app=leetcode.cn id=739 lang=ruby
#
# [739] 每日温度
#
# https://leetcode-cn.com/problems/daily-temperatures/description/
#
# algorithms
# Medium (66.34%)
# Likes:    680
# Dislikes: 0
# Total Accepted:    142K
# Total Submissions: 214K
# Testcase Example:  '[73,74,75,71,69,72,76,73]'
#
# 请根据每日 气温 列表，重新生成一个列表。对应位置的输出为：要想观测到更高的气温，至少需要等待的天数。如果气温在这之后都不会升高，请在该位置用 0
# 来代替。
#
# 例如，给定一个列表 temperatures = [73, 74, 75, 71, 69, 72, 76, 73]，你的输出应该是 [1, 1, 4,
# 2, 1, 1, 0, 0]。
#
# 提示：气温 列表长度的范围是 [1, 30000]。每个气温的值的均为华氏度，都是在 [30, 100] 范围内的整数。
#
#

# @lc code=start
# @param {Integer[]} t
# @return {Integer[]}
def daily_temperatures(t)
  res = Array.new t.size, 0
  stack = []
  t.each_with_index do |n, i|
    until stack.empty? || n <= t[stack.last]
      pop_index = stack.pop
      res[pop_index] = i - pop_index
    end
    stack << i
  end
  res
end
# @lc code=end

p daily_temperatures([73,74,75,71,69,72,76,73])

def daily_temperatures_tl(t)
  res = Array.new t.size
  exit_map = {}
  t.each_with_index do |tem, index|
    if exit_map[tem]
      res[index] = 0
      next
    end

    find_index = index + 1
    until find_index == t.size
      if t[find_index] > tem
        res[index] = find_index - index
        break
      end

      find_index += 1
    end

    if res[index].nil?
      res[index] = 0
      exit_map[tem] = 1
    end
  end

  res
end

# TAG: STACK
# NEED_REVIEW
