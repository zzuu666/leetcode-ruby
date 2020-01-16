#
# @lc app=leetcode.cn id=101 lang=ruby
#
# [101] 对称二叉树
#
# https://leetcode-cn.com/problems/symmetric-tree/description/
#
# algorithms
# Easy (49.36%)
# Likes:    563
# Dislikes: 0
# Total Accepted:    82.8K
# Total Submissions: 167.3K
# Testcase Example:  '[1,2,2,3,4,4,3]'
#
# 给定一个二叉树，检查它是否是镜像对称的。
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
# 但是下面这个 [1,2,2,null,3,null,3] 则不是镜像对称的:
#
# ⁠   1
# ⁠  / \
# ⁠ 2   2
# ⁠  \   \
# ⁠  3    3
#
#
# 说明:
#
# 如果你可以运用递归和迭代两种方法解决这个问题，会很加分。
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

def is_mirror (right, left)
    return true if right == nil && left == nil
    return false if right == nil || left == nil

    return right.val == left.val && is_mirror(right.right, left.left) && is_mirror(right.left, left.right)
end

# @param {TreeNode} root
# @return {Boolean}
def is_symmetric(root)

    is_mirror(root, root)

end
# @lc code=end

=begin
  自己的思路是对于一颗镜像树的话，那么他的左中右遍历和右中左遍历的值是一样的


=end

