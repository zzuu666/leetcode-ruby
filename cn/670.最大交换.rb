#
# @lc app=leetcode.cn id=670 lang=ruby
#
# [670] 最大交换
#
# https://leetcode-cn.com/problems/maximum-swap/description/
#
# algorithms
# Medium (37.31%)
# Likes:    55
# Dislikes: 0
# Total Accepted:    3.3K
# Total Submissions: 8.8K
# Testcase Example:  '2736'
#
# 给定一个非负整数，你至多可以交换一次数字中的任意两位。返回你能得到的最大值。
#
# 示例 1 :
#
#
# 输入: 2736
# 输出: 7236
# 解释: 交换数字2和数字7。
#
#
# 示例 2 :
#
#
# 输入: 9973
# 输出: 9973
# 解释: 不需要交换。
#
#
# 注意:
#
#
# 给定数字的范围是 [0, 10^8]
#
#
#

# @lc code=start

def exchange_pos (str, i, j)
    str_a = str.split('')
    str_a[i] = str[j]
    str_a[j] = str[i]

    return str_a.join('')
end

# @param {Integer} num
# @return {Integer}
def maximum_swap(num)
    num_s = num.to_s
    position = []
    num_s.size.times do |i|
        position[num_s[i].to_i] = i
    end

    num_s.size.times do |j|
        n = num_s[j].to_i
        position.size.downto(1) do |i|
            index = i - 1

            next if index == n || position[index] == nil

            return exchange_pos(num_s, position[index], j).to_i if index > n && position[index] > j
        end
    end

    num
end
# @lc code=end

# 首先很容易想到，我们怎么做才可以获得最大的数，就是把前面的小数和后面的大数进行交换
# O(n^2) 的方法
# 从原始数据的第0项开始寻找，寻找相较于目前比较大的位置比较靠后的那个数进行交换
#
# 我们发现...其实是可以优化的...每次我们都在寻找的是什么
# 是相对于此位置之后的，较大的那个，位置靠后的数
# 我们可以把这个这些数的位置记录下来
# ex: 7657
# 记录 0 1 2 3 4 5 6 7
#               2 1 3
#
# 然后从原始数据的开始来找，从记录数组的后往前找
# 找那个不是当前数的，比当前数大的，位置较后的那个数
# 这样就变 O(n) 了
