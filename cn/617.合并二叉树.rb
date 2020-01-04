#
# @lc app=leetcode.cn id=617 lang=ruby
#
# [617] 合并二叉树
#
# https://leetcode-cn.com/problems/merge-two-binary-trees/description/
#
# algorithms
# Easy (74.45%)
# Likes:    275
# Dislikes: 0
# Total Accepted:    29.5K
# Total Submissions: 39.6K
# Testcase Example:  '[1,3,2,5]\n[2,1,3,null,4,null,7]'
#
# 给定两个二叉树，想象当你将它们中的一个覆盖到另一个上时，两个二叉树的一些节点便会重叠。
# 
# 你需要将他们合并为一个新的二叉树。合并的规则是如果两个节点重叠，那么将他们的值相加作为节点合并后的新值，否则不为 NULL
# 的节点将直接作为新二叉树的节点。
# 
# 示例 1:
# 
# 
# 输入: 
# Tree 1                     Tree 2                  
# ⁠         1                         2                             
# ⁠        / \                       / \                            
# ⁠       3   2                     1   3                        
# ⁠      /                           \   \                      
# ⁠     5                             4   7                  
# 输出: 
# 合并后的树:
# 3
# / \
# 4   5
# / \   \ 
# 5   4   7
# 
# 
# 注意: 合并必须从两个树的根节点开始。
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

# @param {TreeNode} t1
# @param {TreeNode} t2
# @return {TreeNode}
def merge_trees(t1, t2)
    return nil if t1 == nil && t2 == nil
    return t2 if t1 == nil
    return t1 if t2 == nil

    node = TreeNode.new(t1.val + t2.val)
    node.left = merge_trees(t1.left, t2.left)
    node.right = merge_trees(t1.right, t2.right)

    return node
end
# @lc code=end

# 注意：这个解法存在当 t1 或 t2 为 nil 的时候，还是使用了原树的引用


