#
# @lc app=leetcode.cn id=48 lang=ruby
#
# [48] 旋转图像
#
# https://leetcode-cn.com/problems/rotate-image/description/
#
# algorithms
# Medium (72.46%)
# Likes:    852
# Dislikes: 0
# Total Accepted:    160.7K
# Total Submissions: 221.5K
# Testcase Example:  '[[1,2,3],[4,5,6],[7,8,9]]'
#
# 给定一个 n × n 的二维矩阵 matrix 表示一个图像。请你将图像顺时针旋转 90 度。
#
# 你必须在 原地 旋转图像，这意味着你需要直接修改输入的二维矩阵。请不要 使用另一个矩阵来旋转图像。
#
#
#
# 示例 1：
#
#
# 输入：matrix = [[1,2,3],[4,5,6],[7,8,9]]
# 输出：[[7,4,1],[8,5,2],[9,6,3]]
#
#
# 示例 2：
#
#
# 输入：matrix = [[5,1,9,11],[2,4,8,10],[13,3,6,7],[15,14,12,16]]
# 输出：[[15,13,2,5],[14,3,4,1],[12,6,8,9],[16,7,10,11]]
#
#
# 示例 3：
#
#
# 输入：matrix = [[1]]
# 输出：[[1]]
#
#
# 示例 4：
#
#
# 输入：matrix = [[1,2],[3,4]]
# 输出：[[3,1],[4,2]]
#
#
#
#
# 提示：
#
#
# matrix.length == n
# matrix[i].length == n
# 1
# -1000
#
#
#

# @lc code=start
def swap(a, b)
  a, b = b, a
end

def diagonal_swap(matrix)
  len = matrix.size - 1

  len.times do |i|
    (len - i).times do |j|
      matrix[i][j], matrix[len - j][len - i] = matrix[len - j][len - i], matrix[i][j]
    end
  end
end

def undown_swap(matrix)
  len = matrix.size

  (len / 2).times do |i|
    len.times do |j|
      matrix[i][j], matrix[len - 1 - i][j] = matrix[len - 1 - i][j], matrix[i][j]
    end
  end
end


# @param {Integer[][]} matrix
# @return {Void} Do not return anything, modify matrix in-place instead.
def rotate(matrix)
  diagonal_swap(matrix)
  undown_swap(matrix)
end
# @lc code=end

p rotate([[1,2,3],[4,5,6],[7,8,9]])

