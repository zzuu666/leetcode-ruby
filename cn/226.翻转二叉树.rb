#
# @lc app=leetcode.cn id=226 lang=ruby
#
# [226] 翻转二叉树
#
# https://leetcode-cn.com/problems/invert-binary-tree/description/
#
# algorithms
# Easy (73.08%)
# Likes:    332
# Dislikes: 0
# Total Accepted:    45.1K
# Total Submissions: 61.7K
# Testcase Example:  '[4,2,7,1,3,6,9]'
#
# 翻转一棵二叉树。
#
# 示例：
#
# 输入：
#
# ⁠    4
# ⁠  /   \
# ⁠ 2     7
# ⁠/ \   / \
# 1   3 6   9
#
# 输出：
#
# ⁠    4
# ⁠  /   \
# ⁠ 7     2
# ⁠/ \   / \
# 9   6 3   1
#
# 备注:
# 这个问题是受到 Max Howell 的 原问题 启发的 ：
#
# 谷歌：我们90％的工程师使用您编写的软件(Homebrew)，但是您却无法在面试时在白板上写出翻转二叉树这道题，这太糟糕了。
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
def invert_tree(root)
    return nil if root == nil

    temp = root.right

    root.right = root.left
    root.left = temp

    invert_tree(root.right)
    invert_tree(root.left)

    return root
end
# @lc code=end

# 原树反转，先左右交换再递归的反转子树
