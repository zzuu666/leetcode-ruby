=begin
  单调栈可以发现左起最近的小于（大于）当前值的数
  可以参考 LC.739
=end

# inputs 为一个整数数组
def monotone(inputs)
  # 单调栈 用来记录 inputs 的下标
  stack = []

  inputs.each_with_index do |n, i|
    # 这里维护的是一个递增栈
    # 如果 n 比栈顶的元素大的话则可以入栈
    # 否则需要出栈
    until stack.empty? || n >= inputs[stack.last]
      stack.pop
    end

    stack << i
  end
end
