def next_permutation(container)

  miner = -1
  (container.size - 1).downto(1) do |i|
    if container[i - 1] < container[i]
      miner = i - 1
      break
    end
  end

  return container.reverse! if miner == -1

  maxer = -1
  (container.size - 1).downto(miner + 1) do |i|
    if container[i] > container[miner]
      maxer = i
      break
    end
  end

  temp = container[miner]
  container[miner] = container[maxer]
  container[maxer] = temp

  i = miner + 1
  j = container.size - 1

  while i < j
    container[i], container[j] = container[j], container[i]
    i += 1
    j -= 1
  end

  container
end
