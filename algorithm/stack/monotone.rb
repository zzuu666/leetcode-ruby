=begin
  单调栈可以发现左起最近的小于（大于）当前值的数
=end

def monotone(inputs)
  stack = []

  inputs.each_with_index do |n, i|
    # 这里维护的是一个递增栈
    until stack.empty? || n >= inputs[stack.last]
      stack.pop
    end

    stack << i
  end
end
