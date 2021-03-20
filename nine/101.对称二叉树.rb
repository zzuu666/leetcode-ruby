#
# @lc app=leetcode.cn id=101 lang=ruby
#
# [101] 对称二叉树
#
# https://leetcode-cn.com/problems/symmetric-tree/description/
#
# algorithms
# Easy (53.96%)
# Likes:    1297
# Dislikes: 0
# Total Accepted:    286.3K
# Total Submissions: 529.1K
# Testcase Example:  '[1,2,2,3,4,4,3]'
#
# 给定一个二叉树，检查它是否是镜像对称的。
#
#
#
# 例如，二叉树 [1,2,2,3,4,4,3] 是对称的。
#
# ⁠   1
# ⁠  / \
# ⁠ 2   2
# ⁠/ \ / \
# 3  4 4  3
#
#
#
#
# 但是下面这个 [1,2,2,null,3,null,3] 则不是镜像对称的:
#
# ⁠   1
# ⁠  / \
# ⁠ 2   2
# ⁠  \   \
# ⁠  3    3
#
#
#
#
# 进阶：
#
# 你可以运用递归和迭代两种方法解决这个问题吗？
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

def is_mirror?(left, right)
  return true if left.nil? && right.nil?
  return false if left.nil? || right.nil?

  return left.val == right.val && is_mirror?(left.left, right.right) && is_mirror?(left.right, right.left)
end

# @param {TreeNode} root
# @return {Boolean}
def is_symmetric(root)
  is_mirror? root, root
end
# @lc code=end

