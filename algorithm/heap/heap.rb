class Heap
  def initialize(arr)
    @heap = arr
    build
  end

  def parent(i)
    # 找到给定的下标的父节点
    (i - 1) >> 1
  end

  def left(i)
    (i << 1) + 1
  end

  def right(i)
    (i << 1) + 2
  end

  def size
    @heap.size
  end

end
