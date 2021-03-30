#
# @lc app=leetcode.cn id=74 lang=ruby
#
# [74] 搜索二维矩阵
#
# https://leetcode-cn.com/problems/search-a-2d-matrix/description/
#
# algorithms
# Medium (40.80%)
# Likes:    378
# Dislikes: 0
# Total Accepted:    109.3K
# Total Submissions: 252.8K
# Testcase Example:  '[[1,3,5,7],[10,11,16,20],[23,30,34,60]]\n3'
#
# 编写一个高效的算法来判断 m x n 矩阵中，是否存在一个目标值。该矩阵具有如下特性：
#
#
# 每行中的整数从左到右按升序排列。
# 每行的第一个整数大于前一行的最后一个整数。
#
#
#
#
# 示例 1：
#
#
# 输入：matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]], target = 3
# 输出：true
#
#
# 示例 2：
#
#
# 输入：matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]], target = 13
# 输出：false
#
#
#
#
# 提示：
#
#
# m == matrix.length
# n == matrix[i].length
# 1
# -10^4
#
#
#

# @lc code=start
# @param {Integer[][]} matrix
# @param {Integer} target
# @return {Boolean}
def search_matrix(matrix, target)
  i = 0
  j = matrix.size - 1

  while i < j
    m = (i + j + 1) / 2
    if target >= matrix[m][0]
      i = m
    else
      j = m - 1
    end
  end

  return false if matrix[i][0] > target



  # target 必然处于 matrix[m] 中

  l = matrix[i]

  p l

  i = 0
  j = l.size - 1

  while i <= j
    m = (i + j + 1) / 2

    return true if l[m] == target

    if target > l[m]
      i = m + 1
    else
      j = m - 1
    end

    p [i, j]
  end

  false
end
# @lc code=end

