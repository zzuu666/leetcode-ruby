#
# @lc app=leetcode.cn id=5 lang=ruby
#
# [5] 最长回文子串
#
# https://leetcode-cn.com/problems/longest-palindromic-substring/description/
#
# algorithms
# Medium (33.44%)
# Likes:    3483
# Dislikes: 0
# Total Accepted:    541.9K
# Total Submissions: 1.6M
# Testcase Example:  '"babad"'
#
# 给你一个字符串 s，找到 s 中最长的回文子串。
#
#
#
# 示例 1：
#
#
# 输入：s = "babad"
# 输出："bab"
# 解释："aba" 同样是符合题意的答案。
#
#
# 示例 2：
#
#
# 输入：s = "cbbd"
# 输出："bb"
#
#
# 示例 3：
#
#
# 输入：s = "a"
# 输出："a"
#
#
# 示例 4：
#
#
# 输入：s = "ac"
# 输出："a"
#
#
#
#
# 提示：
#
#
# 1
# s 仅由数字和英文字母（大写和/或小写）组成
#
#
#

# @lc code=start
def expand(s, left, right)
  l = left
  r = right

  while l >=0 && r <= s.size - 1 && s[l] == s[r]
    l -= 1
    r += 1
  end

  [l + 1, r - 1]
end

# @param {String} s
# @return {String}
def longest_palindrome(s)
  head = 0
  tail = 0
  s.size.times do |i|
    l1, r1 = expand(s, i, i)
    l2, r2 = expand(s, i, i + 1)

    head, tail = l1, r1 if r1 - l1 > tail - head

    head, tail = l2, r2 if r2 - l2 > tail - head
  end

  s[head..tail]
end
# @lc code=end

p longest_palindrome("caabbaa")


def longest_palindrome_dp(s)
  len = s.size
  dp = Array.new(len) { Array.new(len) }
  res_pos = [0, 0]

  len.times do |gap|
    (len - gap).times do |i|
      j = i + gap

      if gap.zero?
        dp[i][j] = true
      elsif gap == 1
        dp[i][j] = s[i] == s[j]
      else
        dp[i][j] = s[i] == s[j] && dp[i + 1][j - 1]
      end

      res_pos = [i, j] if dp[i][j] && gap + 1 > res_pos[1] - res_pos[0] + 1
    end
  end

  s[res_pos[0]..res_pos[1]]
end
