#
# @lc app=leetcode.cn id=21 lang=ruby
#
# [21] 合并两个有序链表
#
# https://leetcode-cn.com/problems/merge-two-sorted-lists/description/
#
# algorithms
# Easy (58.92%)
# Likes:    790
# Dislikes: 0
# Total Accepted:    160.6K
# Total Submissions: 272.6K
# Testcase Example:  '[1,2,4]\n[1,3,4]'
#
# 将两个有序链表合并为一个新的有序链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。 
# 
# 示例：
# 
# 输入：1->2->4, 1->3->4
# 输出：1->1->2->3->4->4
# 
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

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def merge_two_lists(l1, l2)
    res = ListNode.new(17258)
    res_p = res
    l1_p = l1
    l2_p = l2

    until l1_p == nil || l2_p == nil
        if l1_p.val <= l2_p.val
            res_p.next = l1_p
            l1_p = l1_p.next
        else
            res_p.next = l2_p
            l2_p = l2_p.next
        end

        res_p = res_p.next
    end

    if l1_p
        res_p.next = l1_p
    else
        res_p.next = l2_p
    end

    return res.next
end
# @lc code=end


## 递归的解法

def merge_two_lists(l1, l2)
    return l2 if l1.nil?
    return l1 if l2.nil?
    if l1.val < l2.val
      l1.next = merge_two_lists(l1.next, l2)
      return l1
    else
      l2.next = merge_two_lists(l1, l2.next)
      return l2
    end
end

