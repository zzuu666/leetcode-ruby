# frozen_string_literal: true

=begin
中序遍历的两种实现方式
其中栈模拟的方式需要再理解一下
=end

def inorder_recursive(root)
  return nil if root.nil?

  # 遍历左边节点
  inorder_recursive(root.left)
  # 输出中间节点
  puts root.val
  # 遍历右侧节点
  inorder_recursive(root.right)
end

def inorder_stack(root)
  stack = []
  current = root

  until stack.empty? && current.nil?
    until current.nil?
      stack << current
      current = current.left
    end

    top = stack.pop
    puts top.val
    current = top.right
  end
end
