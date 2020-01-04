#
# @lc app=leetcode.cn id=20 lang=ruby
#
# [20] 有效的括号
#
# https://leetcode-cn.com/problems/valid-parentheses/description/
#
# algorithms
# Easy (40.38%)
# Likes:    1292
# Dislikes: 0
# Total Accepted:    177.8K
# Total Submissions: 440.3K
# Testcase Example:  '"()"'
#
# 给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串，判断字符串是否有效。
# 
# 有效字符串需满足：
# 
# 
# 左括号必须用相同类型的右括号闭合。
# 左括号必须以正确的顺序闭合。
# 
# 
# 注意空字符串可被认为是有效字符串。
# 
# 示例 1:
# 
# 输入: "()"
# 输出: true
# 
# 
# 示例 2:
# 
# 输入: "()[]{}"
# 输出: true
# 
# 
# 示例 3:
# 
# 输入: "(]"
# 输出: false
# 
# 
# 示例 4:
# 
# 输入: "([)]"
# 输出: false
# 
# 
# 示例 5:
# 
# 输入: "{[]}"
# 输出: true
# 
#

# @lc code=start
# @param {String} s
# @return {Boolean}
def is_valid(s)
    stack = []
    right_p = { ')' => '(', ']' => '[', '}' => '{' }


    s.size.times do |i|
        c = s[i]
        if c == '(' || c == '[' || c == '{'
            stack.push(c)
        else
            t = stack.pop
            return false if right_p[c] != t || t == nil
        end
    end

    stack.size == 0
end
# @lc code=end

