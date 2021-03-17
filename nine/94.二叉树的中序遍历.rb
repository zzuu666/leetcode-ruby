#
# @lc app=leetcode.cn id=94 lang=ruby
#
# [94] 二叉树的中序遍历
#
# https://leetcode-cn.com/problems/binary-tree-inorder-traversal/description/
#
# algorithms
# Medium (74.98%)
# Likes:    882
# Dislikes: 0
# Total Accepted:    370.4K
# Total Submissions: 493.6K
# Testcase Example:  '[1,null,2,3]'
#
# 给定一个二叉树的根节点 root ，返回它的 中序 遍历。
#
#
#
# 示例 1：
#
#
# 输入：root = [1,null,2,3]
# 输出：[1,3,2]
#
#
# 示例 2：
#
#
# 输入：root = []
# 输出：[]
#
#
# 示例 3：
#
#
# 输入：root = [1]
# 输出：[1]
#
#
# 示例 4：
#
#
# 输入：root = [1,2]
# 输出：[2,1]
#
#
# 示例 5：
#
#
# 输入：root = [1,null,2]
# 输出：[1,2]
#
#
#
#
# 提示：
#
#
# 树中节点数目在范围 [0, 100] 内
# -100
#
#
#
#
# 进阶: 递归算法很简单，你可以通过迭代算法完成吗？
#
#

# @lc code=start
# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @return {Integer[]}

# def dfs(root, res)
#   return if root.nil?

#   dfs(root.left, res)
#   res << root.val
#   dfs(root.right, res)
# end

def inorder_traversal(root)
  return [] if root.nil?

  stack = []
  res = []

  stack << root

  until stack.empty?
    top = stack.last

    unless top.left.nil?
      stack << top.left
      top.left = nil
      next
    end

    res << top.val
    stack.pop


    unless top.right.nil?
      stack << top.right
      top.right = nil
    end
  end

  res
end
# @lc code=end

