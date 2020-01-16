#
# @lc app=leetcode.cn id=543 lang=ruby
#
# [543] 二叉树的直径
#
# https://leetcode-cn.com/problems/diameter-of-binary-tree/description/
#
# algorithms
# Easy (46.45%)
# Likes:    177
# Dislikes: 0
# Total Accepted:    16.3K
# Total Submissions: 35K
# Testcase Example:  '[1,2,3,4,5]'
#
# 给定一棵二叉树，你需要计算它的直径长度。一棵二叉树的直径长度是任意两个结点路径长度中的最大值。这条路径可能穿过根结点。
#
# 示例 :
# 给定二叉树
#
#
# ⁠         1
# ⁠        / \
# ⁠       2   3
# ⁠      / \
# ⁠     4   5
#
#
# 返回 3, 它的长度是路径 [4,2,1,3] 或者 [5,2,1,3]。
#
# 注意：两结点之间的路径长度是以它们之间边的数目表示。
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

def find_max_depth(node, level)
    return level - 1 if node == nil

    return [find_max_depth(node.left, level + 1), find_max_depth(node.right, level + 1)].max
end

# @param {TreeNode} root
# @return {Integer}
def diameter_of_binary_tree(root)
    return 0 if root == nil

    res = find_max_depth(root.right, 0) + find_max_depth(root.left, 0) + 2

    return [res, diameter_of_binary_tree(root.right), diameter_of_binary_tree(root.left)].max
end
# @lc code=end

# [4,-7,-3,null,null,-9,-3,9,-7,-4,null,6,null,-6,-6,null,null,0,6,5,null,9,null,null,-1,-4,null,null,null,-2]

=begin
需要注意的地方是最长路径可能不经过根节点
=end
