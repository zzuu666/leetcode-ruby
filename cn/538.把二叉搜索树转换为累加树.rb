#
# @lc app=leetcode.cn id=538 lang=ruby
#
# [538] 把二叉搜索树转换为累加树
#
# https://leetcode-cn.com/problems/convert-bst-to-greater-tree/description/
#
# algorithms
# Easy (57.54%)
# Likes:    181
# Dislikes: 0
# Total Accepted:    13.2K
# Total Submissions: 22.8K
# Testcase Example:  '[5,2,13]'
#
# 给定一个二叉搜索树（Binary Search Tree），把它转换成为累加树（Greater
# Tree)，使得每个节点的值是原来的节点值加上所有大于它的节点值之和。
#
# 例如：
#
#
# 输入: 二叉搜索树:
# ⁠             5
# ⁠           /   \
# ⁠          2     13
#
# 输出: 转换为累加树:
# ⁠            18
# ⁠           /   \
# ⁠         20     13
#
#
#

# @lc code=start
# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {TreeNode}
def convert_bst(root)
    @prev = 0
    def convert_node(node)
        return if node == nil
        convert_node(node.right)
        node.val += @prev
        @prev = node.val
        convert_node(node.left)
    end

    convert_node(root)

    return root
end
# @lc code=end

# 根据BST的性质进行 右 中 左 遍历
# 遍历到自己的时候累加一下当前值，并把自己赋值为累加值
