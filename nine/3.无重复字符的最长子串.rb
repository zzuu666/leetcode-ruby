#
# @lc app=leetcode.cn id=3 lang=ruby
#
# [3] 无重复字符的最长子串
#
# https://leetcode-cn.com/problems/longest-substring-without-repeating-characters/description/
#
# algorithms
# Medium (36.62%)
# Likes:    5110
# Dislikes: 0
# Total Accepted:    872.6K
# Total Submissions: 2.4M
# Testcase Example:  '"abcabcbb"'
#
# 给定一个字符串，请你找出其中不含有重复字符的 最长子串 的长度。
#
#
#
# 示例 1:
#
#
# 输入: s = "abcabcbb"
# 输出: 3
# 解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
#
#
# 示例 2:
#
#
# 输入: s = "bbbbb"
# 输出: 1
# 解释: 因为无重复字符的最长子串是 "b"，所以其长度为 1。
#
#
# 示例 3:
#
#
# 输入: s = "pwwkew"
# 输出: 3
# 解释: 因为无重复字符的最长子串是 "wke"，所以其长度为 3。
# 请注意，你的答案必须是 子串 的长度，"pwke" 是一个子序列，不是子串。
#
#
# 示例 4:
#
#
# 输入: s = ""
# 输出: 0
#
#
#
#
# 提示：
#
#
# 0
# s 由英文字母、数字、符号和空格组成
#
#
#

# @lc code=start
# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
  return 0 if s == ''
  # 这里使用 -1 是为了方便计算长度
  # 记录下一次计算长度的起始位置
  start = -1
  char_map = {}
  res = 0

  s.each_char.with_index do |char, index|
    # 如果遇到的了已经存在的字符，并且这个字符是出现在了起始位置之后
    if char_map[char] && char_map[char] > start
      # 更新起始位置
      start = char_map[char]
    else
      # 计算最新长度
      res = [res, index - start].max
    end
    char_map[char] = index
  end

  res
end
# @lc code=end

=begin
  第一种比较好想的思路，使用 hash 来记录出现过的字符
  如果该字符没有出现过，那就让长度 +1 然后和之前的长度比较取最大的
  如果该字符出现了，那么回到该字符出现过的位置的下一个字符开始重新寻找
  但是这样是有浪费的
  因为我们找到 start..point 的时候，start + 1 到 point 的之间必然是没有重复字符的
=end
