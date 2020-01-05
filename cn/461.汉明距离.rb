#
# @lc app=leetcode.cn id=461 lang=ruby
#
# [461] 汉明距离
#
# https://leetcode-cn.com/problems/hamming-distance/description/
#
# algorithms
# Easy (74.04%)
# Likes:    222
# Dislikes: 0
# Total Accepted:    37.3K
# Total Submissions: 50.4K
# Testcase Example:  '1\n4'
#
# 两个整数之间的汉明距离指的是这两个数字对应二进制位不同的位置的数目。
# 
# 给出两个整数 x 和 y，计算它们之间的汉明距离。
# 
# 注意：
# 0 ≤ x, y < 2^31.
# 
# 示例:
# 
# 
# 输入: x = 1, y = 4
# 
# 输出: 2
# 
# 解释:
# 1   (0 0 0 1)
# 4   (0 1 0 0)
# ⁠      ↑   ↑
# 
# 上面的箭头指出了对应二进制位不同的位置。
# 
# 
#

# @lc code=start
# @param {Integer} x
# @param {Integer} y
# @return {Integer}
def hamming_distance(x, y)
    t = x ^ y
    res = 0

    while t != 0
        res += 1 if t % 2 == 1

        t = t >> 1
    end

    res

end
# @lc code=end

