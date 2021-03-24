#
# @lc app=leetcode.cn id=147 lang=ruby
#
# [147] 对链表进行插入排序
#
# https://leetcode-cn.com/problems/insertion-sort-list/description/
#
# algorithms
# Medium (67.21%)
# Likes:    368
# Dislikes: 0
# Total Accepted:    80.3K
# Total Submissions: 119.3K
# Testcase Example:  '[4,2,1,3]'
#
# 对链表进行插入排序。
#
#
# 插入排序的动画演示如上。从第一个元素开始，该链表可以被认为已经部分排序（用黑色表示）。
# 每次迭代时，从输入数据中移除一个元素（用红色表示），并原地将其插入到已排好序的链表中。
#
#
#
# 插入排序算法：
#
#
# 插入排序是迭代的，每次只移动一个元素，直到所有元素可以形成一个有序的输出列表。
# 每次迭代中，插入排序只从输入数据中移除一个待排序的元素，找到它在序列中适当的位置，并将其插入。
# 重复直到所有输入数据插入完为止。
#
#
#
#
# 示例 1：
#
# 输入: 4->2->1->3
# 输出: 1->2->3->4
#
#
# 示例 2：
#
# 输入: -1->5->3->4->0
# 输出: -1->0->3->4->5
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
# @return {ListNode}
def insertion_sort_list(head)
  return head if head.nil? || head.next.nil?

  dummy_head = ListNode.new
  dummy_head.next = head

  current = head.next
  last_sorted = head

  until current.nil?
    if current.val >= last_sorted.val
      # 因为 current == last_sorted.next
      # 所以如果 current 要比最后一个 sorted 的位置还大的话
      # 直接将指针往前移动一位即可
      last_sorted = last_sorted.next
    else
      temp = dummy_head
      until current.val < temp.next.val
        temp = temp.next
      end

      # 先确定好下一个要寻找的节点
      # 相当于 last_sorted 的节点是没有变化的
      last_sorted.next = current.next

      # x -> t -> z
      # x -> t -> c -> z
      current.next = temp.next
      temp.next = current
    end
    # 从下一个未排序的地方找起
    current = last_sorted.next
  end

  dummy_head.next
end
# @lc code=end

