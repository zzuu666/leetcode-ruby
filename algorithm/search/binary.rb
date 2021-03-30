def binary_search(container, target)
  low = 0
  high = container.size - 1

  while low <= high
    mid = (low + high) / 2
    val = container[mid]


    return mid if val == target

    if val > target
      high = mid - 1
    else
      low = mid + 1
    end
  end

  nil

  # target 大于的最后一个的值

  # p [low, high, mid]

  # low > mid ? mid : high

end

p binary_search([2, 5, 7, 10, 15, 20, 25], 8)
