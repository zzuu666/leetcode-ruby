#
# @lc app=leetcode.cn id=144 lang=ruby
#
# [144] 二叉树的前序遍历
#
# https://leetcode-cn.com/problems/binary-tree-preorder-traversal/description/
#
# algorithms
# Medium (69.31%)
# Likes:    538
# Dislikes: 0
# Total Accepted:    280.6K
# Total Submissions: 404.5K
# Testcase Example:  '[1,null,2,3]'
#
# 给你二叉树的根节点 root ，返回它节点值的 前序 遍历。
#
#
#
# 示例 1：
#
#
# 输入：root = [1,null,2,3]
# 输出：[1,2,3]
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
# 输出：[1,2]
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
# 进阶：递归算法很简单，你可以通过迭代算法完成吗？
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

def dfs(node, res)
  return if node.nil?

  res << node.val
  dfs node.left, res
  dfs node.right, res
end
# @param {TreeNode} root
# @return {Integer[]}
def preorder_traversal(root)
  res = []
  dfs(root, res)
  res
end
# @lc code=end

