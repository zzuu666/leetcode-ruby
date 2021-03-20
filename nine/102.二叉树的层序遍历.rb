#
# @lc app=leetcode.cn id=102 lang=ruby
#
# [102] 二叉树的层序遍历
#
# https://leetcode-cn.com/problems/binary-tree-level-order-traversal/description/
#
# algorithms
# Medium (64.21%)
# Likes:    812
# Dislikes: 0
# Total Accepted:    272K
# Total Submissions: 423.5K
# Testcase Example:  '[3,9,20,null,null,15,7]'
#
# 给你一个二叉树，请你返回其按 层序遍历 得到的节点值。 （即逐层地，从左到右访问所有节点）。
#
#
#
# 示例：
# 二叉树：[3,9,20,null,null,15,7],
#
#
# ⁠   3
# ⁠  / \
# ⁠ 9  20
# ⁠   /  \
# ⁠  15   7
#
#
# 返回其层序遍历结果：
#
#
# [
# ⁠ [3],
# ⁠ [9,20],
# ⁠ [15,7]
# ]
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

# @param {TreeNode} root
# @return {Integer[][]}
def level_order(root)
  return [] if root.nil?

  res = []
  step = 0
  queue = Queue.new

  queue << root

  until queue.empty?
    # 全部清空当前队列
    queue.size.times do
      # 获取到当前节点
      node = queue.pop
      res[step] ||= []
      res[step] << node.val

      queue << node.left unless node.left.nil?
      queue << node.right unless node.right.nil?
    end
    step += 1
  end

  res
end
# @lc code=end

