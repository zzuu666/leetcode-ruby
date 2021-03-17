def dfs_recursion(current, target, set)
  # 如果寻找到了目标节点则返回
  return true if current == target

  current.children.each do |node|
    next if set.include?(node)

    set << node
    return true if dfs(node, target, set)
  end

  false
end

def dfs_no_recursion(root, target)
  stack = []
  visited = Set.new
  stack << root

  until stack.empty?
    top_node = stack.pop
    return true if top_node == target

    top_node.children.each do |node|
      next if set.include? node

      stack << node
      visited << node
    end
  end

  false
end
