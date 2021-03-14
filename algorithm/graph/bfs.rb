def bfs(root, target)
  queue = Queue.new
  # 用来记录节点是否被访问过
  set = Set.new
  queue << root
  set << root

  step = 0

  until queue.empty?
    step += 1
    queue.size.times do
      current = queue.pop
      return step if current == target

      current.children.each do |node|
        next if set.include?(node)

        queue << node
        set << node
      end
    end
  end

  -1
end
