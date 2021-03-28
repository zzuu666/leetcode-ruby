require_relative './heap'

class MaxHeap < Heap
  # 将下标为 i 的元素调整至为符合大顶堆性质的位置
  def heapify(i)
    l = left i
    r = right i
    largest = i
    puts "heapify index #{i}, value #{@heap[i]}, l #{l}, l_v #{@heap[l]} r #{r}, r_v #{@heap[r]}"


    if l < size && @heap[l] > @heap[i]
      largest = l
    end

    if r < size && @heap[r] > @heap[largest]
      largest = r
    end

    if largest != i
      @heap[largest], @heap[i] = @heap[i], @heap[largest]
      heapify(largest)
    end
  end

  def build
    # 自底向上的去构建一个大顶推
    # 这里一定要是自底向上，这样可以保证大元素可以跑到顶端
    # 我们从最后一个叶子节点的父节点开始向上维护大顶堆的性质
    parent(size - 1).downto(0) do |i|
      heapify(i)
    end
  end

  def sort
    res = []
    (size - 1).downto(1) do |i|
      @heap[i], @heap[0] = @heap[0], @heap[i]
      res << @heap.pop
      heapify(0)
    end

    res << @heap.pop
    res
  end
end
