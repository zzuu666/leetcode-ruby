#
# @lc app=leetcode.cn id=200 lang=ruby
#
# [200] 岛屿数量
#
# https://leetcode-cn.com/problems/number-of-islands/description/
#
# algorithms
# Medium (52.82%)
# Likes:    1031
# Dislikes: 0
# Total Accepted:    217.4K
# Total Submissions: 411.2K
# Testcase Example:  '[["1","1","1","1","0"],["1","1","0","1","0"],["1","1","0","0","0"],["0","0","0","0","0"]]'
#
# 给你一个由 '1'（陆地）和 '0'（水）组成的的二维网格，请你计算网格中岛屿的数量。
#
# 岛屿总是被水包围，并且每座岛屿只能由水平方向和/或竖直方向上相邻的陆地连接形成。
#
# 此外，你可以假设该网格的四条边均被水包围。
#
#
#
# 示例 1：
#
#
# 输入：grid = [
# ⁠ ["1","1","1","1","0"],
# ⁠ ["1","1","0","1","0"],
# ⁠ ["1","1","0","0","0"],
# ⁠ ["0","0","0","0","0"]
# ]
# 输出：1
#
#
# 示例 2：
#
#
# 输入：grid = [
# ⁠ ["1","1","0","0","0"],
# ⁠ ["1","1","0","0","0"],
# ⁠ ["0","0","1","0","0"],
# ⁠ ["0","0","0","1","1"]
# ]
# 输出：3
#
#
#
#
# 提示：
#
#
# m == grid.length
# n == grid[i].length
# 1
# grid[i][j] 的值为 '0' 或 '1'
#
#
#

# @lc code=start
# @param {Character[][]} grid
# @return {Integer}
def num_islands(grid)
  res = 0
  grid.each_with_index do |row, rowNumber|
    row.each_with_index do |cell, colNumber|
      next if cell == "0"
      queue = Queue.new
      queue << [rowNumber, colNumber]

      p [rowNumber, colNumber]

      until queue.empty?
        queue.size.times do
          # [r, c]
          cr, cc = queue.pop
          next if grid[cr][cc] == "0"

          grid[cr][cc] = "0"
          # 向上寻找
          queue << [cr - 1, cc] if cr - 1 >= 0 && grid[cr - 1][cc] != "0"

          # 向下寻找
          queue << [cr + 1, cc] if cr + 1 < grid.size && grid[cr + 1][cc] != "0"

          # 向左寻找
          queue << [cr, cc - 1] if cc - 1 >= 0 && grid[cr][cc - 1] != "0"

          # 向右寻找
          queue << [cr, cc + 1] if cc + 1 < row.size && grid[cr][cc + 1] != "0"

        end
      end

      res += 1
    end
  end

  res
end
# @lc code=end

# TAG: BFS

=begin
用 BFS 来解的题
从岛的左上角开始遍历，遇到 1 则开始一次以这个点为起点的 BFS
然后把符合条件的邻居加入到 Queue 中去
第一次 WA 是因为只找了向下和向右的邻居，忽略了「工」字型的 case
第二次 WA 是因为上左的边界条件写成了 x > 0 应该是 >= 0
其实处理边界比较好的方案是在周围围一圈 0
=end

p num_islands([["1","1","1"],["0","1","0"],["1","1","1"]])
