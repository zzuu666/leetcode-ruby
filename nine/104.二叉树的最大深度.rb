#
# @lc app=leetcode.cn id=104 lang=ruby
#
# [104] 二叉树的最大深度
#
# https://leetcode-cn.com/problems/maximum-depth-of-binary-tree/description/
#
# algorithms
# Easy (75.86%)
# Likes:    824
# Dislikes: 0
# Total Accepted:    372.5K
# Total Submissions: 490.8K
# Testcase Example:  '[3,9,20,null,null,15,7]'
#
# 给定一个二叉树，找出其最大深度。
#
# 二叉树的深度为根节点到最远叶子节点的最长路径上的节点数。
#
# 说明: 叶子节点是指没有子节点的节点。
#
# 示例：
# 给定二叉树 [3,9,20,null,null,15,7]，
#
# ⁠   3
# ⁠  / \
# ⁠ 9  20
# ⁠   /  \
# ⁠  15   7
#
# 返回它的最大深度 3 。
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
# @return {Integer}
def max_depth(root)
  return 0 if root.nil?

  l = max_depth root.left
  r = max_depth root.right
  [l, r].max + 1
end
# @lc code=end

=begin
这是一种自底向上递归的解决思路
这样的好处是不需要额外的函数/变量来存储结果
=end

