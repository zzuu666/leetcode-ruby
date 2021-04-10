#
# @lc app=leetcode.cn id=49 lang=ruby
#
# [49] 字母异位词分组
#
# https://leetcode-cn.com/problems/group-anagrams/description/
#
# algorithms
# Medium (65.55%)
# Likes:    713
# Dislikes: 0
# Total Accepted:    179.8K
# Total Submissions: 273.8K
# Testcase Example:  '["eat","tea","tan","ate","nat","bat"]'
#
# 给定一个字符串数组，将字母异位词组合在一起。字母异位词指字母相同，但排列不同的字符串。
#
# 示例:
#
# 输入: ["eat", "tea", "tan", "ate", "nat", "bat"]
# 输出:
# [
# ⁠ ["ate","eat","tea"],
# ⁠ ["nat","tan"],
# ⁠ ["bat"]
# ]
#
# 说明：
#
#
# 所有输入均为小写字母。
# 不考虑答案输出的顺序。
#
#
#

# @lc code=start
@prime = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103]
# @param {String[]} strs
# @return {String[][]}
def group_anagrams(strs)
  hash = {}

  strs.each do |str|
    key = 1
    str.split('').each do |c|
      key *= @prime[c.ord - 97]
    end
    hash[key] = hash[key] || []
    hash[key] << str
  end
  hash.values
end
# @lc code=end

p group_anagrams(["eat","tea","tan","ate","nat","bat"])

=begin
这个题解的太帅了利用了质数相乘后的唯一性做 key
tql
=end
