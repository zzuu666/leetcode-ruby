#
# @lc app=leetcode.cn id=206 lang=ruby
#
# [206] 反转链表
#
# https://leetcode-cn.com/problems/reverse-linked-list/description/
#
# algorithms
# Easy (71.46%)
# Likes:    1621
# Dislikes: 0
# Total Accepted:    482.4K
# Total Submissions: 674.9K
# Testcase Example:  '[1,2,3,4,5]'
#
# 反转一个单链表。
#
# 示例:
#
# 输入: 1->2->3->4->5->NULL
# 输出: 5->4->3->2->1->NULL
#
# 进阶:
# 你可以迭代或递归地反转链表。你能否用两种方法解决这道题？
#
#

# @lc code=start
# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @return {ListNode}
def reverse_list(head)
  return head if head.nil? || head.next.nil?

  reversed = reverse_list(head.next)
  head.next.next = head
  head.next = nil
  reversed
end
# @lc code=end

def reverse_list_iteration(head)
  return nil if head.nil?

  prev = nil

  loop do
    temp = head.next
    head.next = prev
    prev = head
    break if temp.nil?

    head = temp
  end

  head
end

=begin
递归的方法还是更好理解一些
=end
