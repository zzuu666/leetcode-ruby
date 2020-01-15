#
# @lc app=leetcode.cn id=234 lang=ruby
#
# [234] 回文链表
#
# https://leetcode-cn.com/problems/palindrome-linked-list/description/
#
# algorithms
# Easy (39.58%)
# Likes:    371
# Dislikes: 0
# Total Accepted:    56.1K
# Total Submissions: 141.3K
# Testcase Example:  '[1,2]'
#
# 请判断一个链表是否为回文链表。
#
# 示例 1:
#
# 输入: 1->2
# 输出: false
#
# 示例 2:
#
# 输入: 1->2->2->1
# 输出: true
#
#
# 进阶：
# 你能否用 O(n) 时间复杂度和 O(1) 空间复杂度解决此题？
#
#

# @lc code=start
# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

class ListNode
    attr_accessor :prev
end

# @param {ListNode} head
# @return {Boolean}
def is_palindrome(head)
    return true if head == nil
    head_point = head
    count = 1

    until head_point.next == nil
        head_point.next.prev = head_point
        head_point = head_point.next
        count += 1
    end

    step = count / 2

    while step != 0
        return false if head.val != head_point.val
        head = head.next
        head_point = head_point.prev
        step -= 1
    end

    true
end
# @lc code=end

=begin
个人认为解的很棒！
制作一个双向链表

为什么要用step，一个比较好的结束回文判断的条件
=end
