require 'set'
def dfs(nums, visited, path, depth, res)
  if depth == nums.size
    res << path.dup
    return
  end

  nums.each do |num|
    next if visited.include?(num)

    path << num
    visited << num
    dfs(nums, visited, path, depth + 1, res)
    path.pop
    visited.delete num
  end
end

# @param {Integer[]} nums
# @return {Integer[][]}
def permute(nums)
  return [] if nums.empty?

  visited = Set.new
  res = []

  dfs(nums, visited, [], 0, res)
  res
end
