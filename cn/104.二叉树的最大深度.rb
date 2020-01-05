#
# @lc app=leetcode.cn id=104 lang=ruby
#
# [104] 二叉树的最大深度
#
# https://leetcode-cn.com/problems/maximum-depth-of-binary-tree/description/
#
# algorithms
# Easy (71.67%)
# Likes:    422
# Dislikes: 0
# Total Accepted:    108.9K
# Total Submissions: 151.9K
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
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end


# @param {TreeNode} root
# @return {Integer}
def max_depth(root)
    @res = 0

    def dfs(node, level)
        return nil if node == nil
        @res = [level, @res].max

        dfs(node.left, level + 1)
        dfs(node.right, level + 1)
    end

    dfs(root, 1)

    @res
end
# @lc code=end

# 上述解法有点挫， 因为使用了类变量

# 下面为优化后版本
# 这个方法的作用是求得传入节点的最大高度
def max_depth(node)
    # 如果传入节点为 nil 则它的高度就是 0
    return 0 if node == nil

    # left_height = max_depth(node.left) + 1
    # right_height = max_depth(node.right) + 1

    # return [left_height, right_height].max
    return [max_depth(node.left), max_depth(node.right)].max + 1
end
