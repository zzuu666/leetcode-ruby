#
# @lc app=leetcode.cn id=437 lang=ruby
#
# [437] 路径总和 III
#
# https://leetcode-cn.com/problems/path-sum-iii/description/
#
# algorithms
# Easy (52.99%)
# Likes:    259
# Dislikes: 0
# Total Accepted:    17.2K
# Total Submissions: 32.5K
# Testcase Example:  '[10,5,-3,3,2,null,11,3,-2,null,1]\n8'
#
# 给定一个二叉树，它的每个结点都存放着一个整数值。
#
# 找出路径和等于给定数值的路径总数。
#
# 路径不需要从根节点开始，也不需要在叶子节点结束，但是路径方向必须是向下的（只能从父节点到子节点）。
#
# 二叉树不超过1000个节点，且节点数值范围是 [-1000000,1000000] 的整数。
#
# 示例：
#
# root = [10,5,-3,3,2,null,11,3,-2,null,1], sum = 8
#
# ⁠     10
# ⁠    /  \
# ⁠   5   -3
# ⁠  / \    \
# ⁠ 3   2   11
# ⁠/ \   \
# 3  -2   1
#
# 返回 3。和等于 8 的路径有:
#
# 1.  5 -> 3
# 2.  5 -> 2 -> 1
# 3.  -3 -> 11
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

def node_sum(node, sum)
    return 0 if node == nil

    self_equal = sum == node.val ? 1 : 0


    return node_sum(node.right, sum - node.val) + node_sum(node.left, sum - node.val) + self_equal
end

# @param {TreeNode} root
# @param {Integer} sum
# @return {Integer}
def path_sum(root, sum)
    return 0 if root == nil

    self_equal = sum == root.val ? 1 : 0

    return path_sum(root.right, sum) + path_sum(root.left, sum) + self_equal + node_sum(root.right, sum - root.val) + node_sum(root.left, sum - root.val)
end

# @lc code=end

=begin
path_sum: 返回此节点满足 sum 的数量
这个数量由5部分组成（特殊case nil必然为 0 ）

1. 左子树满足 sum 的路径数目
2. 右子树满足 sum 的路径数目
3. 若自身满足结果 + 1
4. 右边**节点**满足 sum - node.val 的数量
5. 左边**节点**满足 sum - node.val 的数量

=end

