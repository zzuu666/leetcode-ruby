#
# @lc app=leetcode.cn id=82 lang=ruby
#
# [82] 删除排序链表中的重复元素 II
#
# https://leetcode-cn.com/problems/remove-duplicates-from-sorted-list-ii/description/
#
# algorithms
# Medium (50.39%)
# Likes:    490
# Dislikes: 0
# Total Accepted:    94K
# Total Submissions: 186K
# Testcase Example:  '[1,2,3,3,4,4,5]'
#
# 给定一个排序链表，删除所有含有重复数字的节点，只保留原始链表中 没有重复出现 的数字。
#
# 示例 1:
#
# 输入: 1->2->3->3->4->4->5
# 输出: 1->2->5
#
#
# 示例 2:
#
# 输入: 1->1->1->2->3
# 输出: 2->3
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
def delete_duplicates(head)
  return head if head.nil? || head.next.nil?

  dummy = ListNode.new(0, head)
  prev = dummy
  curr = dummy.next
  should_remove = false

  until curr.next.nil?
    if curr.next.val == curr.val
      prev.next = curr.next
      should_remove = true
    else
      if should_remove
        prev.next = curr.next
      else
        prev = curr
      end
      should_remove = false
    end
    curr = curr.next
  end

  prev.next = nil if should_remove

  dummy.next
end
# @lc code=end

