#
# @lc app=leetcode.cn id=22 lang=ruby
#
# [22] 括号生成
#
# https://leetcode-cn.com/problems/generate-parentheses/description/
#
# algorithms
# Medium (76.94%)
# Likes:    1709
# Dislikes: 0
# Total Accepted:    256.6K
# Total Submissions: 333.2K
# Testcase Example:  '3'
#
# 数字 n 代表生成括号的对数，请你设计一个函数，用于能够生成所有可能的并且 有效的 括号组合。
#
#
#
# 示例 1：
#
#
# 输入：n = 3
# 输出：["((()))","(()())","(())()","()(())","()()()"]
#
#
# 示例 2：
#
#
# 输入：n = 1
# 输出：["()"]
#
#
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
def backtrack(s, left, right, n, res)
  # 终止条件达到长度后就把结果返回
  if s.size == n * 2
    res << s.join('')
    return
  end

  # 如果左括号的数量比预设少可以放置一个左括号
  if left < n
    s << '('
    backtrack(s, left + 1, right, n, res)
    s.pop
  end

  # 右括号比左括号少的时候要放一个右括号
  if right < left
    s << ')'
    backtrack(s, left, right + 1, n, res)
    s.pop
  end
end
# @param {Integer} n
# @return {String[]}
def generate_parenthesis(n)
  res = []
  s = []
  backtrack(s, 0, 0, n, res)
  res
end
# @lc code=end

