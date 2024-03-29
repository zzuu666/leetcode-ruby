#
# @lc app=leetcode.cn id=19 lang=ruby
#
# [19] 删除链表的倒数第 N 个结点
#
# https://leetcode-cn.com/problems/remove-nth-node-from-end-of-list/description/
#
# algorithms
# Medium (41.25%)
# Likes:    1307
# Dislikes: 0
# Total Accepted:    362.8K
# Total Submissions: 873.3K
# Testcase Example:  '[1,2,3,4,5]\n2'
#
# 给你一个链表，删除链表的倒数第 n 个结点，并且返回链表的头结点。
#
# 进阶：你能尝试使用一趟扫描实现吗？
#
#
#
# 示例 1：
#
#
# 输入：head = [1,2,3,4,5], n = 2
# 输出：[1,2,3,5]
#
#
# 示例 2：
#
#
# 输入：head = [1], n = 1
# 输出：[]
#
#
# 示例 3：
#
#
# 输入：head = [1,2], n = 1
# 输出：[1]
#
#
#
#
# 提示：
#
#
# 链表中结点的数目为 sz
# 1
# 0
# 1
#
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
# @param {Integer} n
# @return {ListNode}
def remove_nth_from_end(head, n)
  temp = []
  cursor = head
  until cursor.nil?
    temp << cursor
    cursor = cursor.next
  end

  remove = temp.size - n

  return head.next if remove.zero?

  temp[remove - 1].next = temp[remove].next

  head
end
# @lc code=end

