#
# @lc app=leetcode.cn id=2 lang=ruby
#
# [2] 两数相加
#
# https://leetcode-cn.com/problems/add-two-numbers/description/
#
# algorithms
# Medium (39.70%)
# Likes:    5986
# Dislikes: 0
# Total Accepted:    787K
# Total Submissions: 2M
# Testcase Example:  '[2,4,3]\n[5,6,4]'
#
# 给你两个 非空 的链表，表示两个非负的整数。它们每位数字都是按照 逆序 的方式存储的，并且每个节点只能存储 一位 数字。
#
# 请你将两个数相加，并以相同形式返回一个表示和的链表。
#
# 你可以假设除了数字 0 之外，这两个数都不会以 0 开头。
#
#
#
# 示例 1：
#
#
# 输入：l1 = [2,4,3], l2 = [5,6,4]
# 输出：[7,0,8]
# 解释：342 + 465 = 807.
#
#
# 示例 2：
#
#
# 输入：l1 = [0], l2 = [0]
# 输出：[0]
#
#
# 示例 3：
#
#
# 输入：l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
# 输出：[8,9,9,9,0,0,0,1]
#
#
#
#
# 提示：
#
#
# 每个链表中的节点数在范围 [1, 100] 内
# 0
# 题目数据保证列表表示的数字不含前导零
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
# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def add_two_numbers(l1, l2)
  res = ListNode.new
  point = res
  need_one = 0
  until l1 == nil && l2 == nil
    l1_val = l1.nil? || l1.val.nil? ? 0 : l1.val
    l2_val = l2.nil? || l2.val.nil? ? 0 : l2.val

    n_val = l1_val + l2_val + need_one

    need_one = n_val >= 10 ? 1 : 0

    n_node = ListNode.new(n_val % 10)
    point.next = n_node
    point = point.next

    l1 = l1.nil? ? nil : l1.next
    l2 = l2.nil? ? nil : l2.next
  end

  point.next = ListNode.new 1 if need_one == 1

  res.next
end
# @lc code=end

=begin
This question not difficult, but there is some edge case need handle
e.g. when need_one equal 1, it needs add a new ListNode
=end
