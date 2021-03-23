#
# @lc app=leetcode.cn id=143 lang=ruby
#
# [143] 重排链表
#
# https://leetcode-cn.com/problems/reorder-list/description/
#
# algorithms
# Medium (59.60%)
# Likes:    543
# Dislikes: 0
# Total Accepted:    85.6K
# Total Submissions: 143.3K
# Testcase Example:  '[1,2,3,4]'
#
# 给定一个单链表 L：L0→L1→…→Ln-1→Ln ，
# 将其重新排列后变为： L0→Ln→L1→Ln-1→L2→Ln-2→…
#
# 你不能只是单纯的改变节点内部的值，而是需要实际的进行节点交换。
#
# 示例 1:
#
# 给定链表 1->2->3->4, 重新排列为 1->4->2->3.
#
# 示例 2:
#
# 给定链表 1->2->3->4->5, 重新排列为 1->5->2->4->3.
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
# @return {Void} Do not return anything, modify head in-place instead.
def reorder_list(head)
  return if head.nil?

  index_map = []

  point = head

  until point.nil?
    index_map << point
    point = point.next
  end

  i = 0
  j = index_map.size - 1

  while i < j
    index_map[i].next = index_map[j]
    i += 1

    break if i == j

    index_map[j].next = index_map[i]
    j -= 1
  end

  index_map[i].next = nil
end
# @lc code=end

