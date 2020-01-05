#
# @lc app=leetcode.cn id=206 lang=ruby
#
# [206] 反转链表
#
# https://leetcode-cn.com/problems/reverse-linked-list/description/
#
# algorithms
# Easy (66.16%)
# Likes:    718
# Dislikes: 0
# Total Accepted:    138.5K
# Total Submissions: 209.3K
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
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @return {ListNode}
def reverse_list(head)
    # edge case nil
    return nil if head == nil
    h = head
    c = head.next
    h.next = nil
    #           h     c
    # edge case 1 -> nil
    return h if c == nil
    n = c.next
    #                     h   c    n
    # normal case  nil <- 1   2 -> nil
    c.next = h
    #            h    c    n
    #     nil <- 1 <- 2   nil

    # repeat
    until n == nil
        h = c
        c = n
        n = n.next
        c.next = h
    end

    c
end
# @lc code=end


# 迭代式可以用更简洁的写法来

def reverse_list(head)
    prev = nil
    current = head

    #   p   c
    #  nil  1 -> 2 -> 3 -> nil

    until current == nil
        temp = current.next
        #   p   c    t
        #  nil  1 -> 2 -> 3 -> nil
        #  保存了 c.next 的引用后则可以动它
        current.next = prev
        #   p     c    t
        #  nil <- 1    2 -> 3 -> nil
        prev = current
        #        p,c   t
        #  nil <- 1    2 -> 3 -> nil
        current = temp
        #        p     c(t)
        #  nil <- 1    2 -> 3 -> nil
    end

    prev
end

# 再来，就是递归式
# 递归的核心为我这一层只负责我这一层的逻辑
# 其他的已经变好了

def reverse_list(head)
    return head if head == nil || head.next == nil
    # res 的是尾端节点的引用
    res = reverse_list(head.next)
    # 此时 head.next 已经是反向的了，思考如何把head 和 head.next 拼接起来

    head.next.next = head
    head.next = nil
    # that's all

    res
end

