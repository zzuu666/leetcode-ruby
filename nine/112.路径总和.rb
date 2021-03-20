#
# @lc app=leetcode.cn id=112 lang=ruby
#
# [112] 路径总和
#
# https://leetcode-cn.com/problems/path-sum/description/
#
# algorithms
# Easy (51.94%)
# Likes:    546
# Dislikes: 0
# Total Accepted:    185.4K
# Total Submissions: 356.7K
# Testcase Example:  '[5,4,8,11,null,13,4,7,2,null,null,null,1]\n22'
#
# 给你二叉树的根节点 root 和一个表示目标和的整数 targetSum ，判断该树中是否存在 根节点到叶子节点
# 的路径，这条路径上所有节点值相加等于目标和 targetSum 。
#
# 叶子节点 是指没有子节点的节点。
#
#
#
# 示例 1：
#
#
# 输入：root = [5,4,8,11,null,13,4,7,2,null,null,null,1], targetSum = 22
# 输出：true
#
#
# 示例 2：
#
#
# 输入：root = [1,2,3], targetSum = 5
# 输出：false
#
#
# 示例 3：
#
#
# 输入：root = [1,2], targetSum = 0
# 输出：false
#
#
#
#
# 提示：
#
#
# 树中节点的数目在范围 [0, 5000] 内
# -1000
# -1000
#
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

def dfs(root, target, current)
  return false if root.nil?

  next_sum = current + root.val
  return target == current + root.val if root.right.nil? && root.left.nil?

  dfs(root.left, target, next_sum) || dfs(root.right, target, next_sum)
end
# @param {TreeNode} root
# @param {Integer} target_sum
# @return {Boolean}
def has_path_sum(root, target_sum)
  dfs root, target_sum, 0
end
# @lc code=end

