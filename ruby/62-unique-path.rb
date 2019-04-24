# Runtime: 36 ms, faster than 88.57%
# Memory Usage: 9.3 MB, less than 100.00%

# @param {Integer} m
# @param {Integer} n
# @return {Integer}
def unique_paths(m, n)
  return 1 if n == 1 || m == 1

  map = Array.new(n + 1){Array.new(m + 1){0}}

  n.times do |y|
    m.times do |x|
      if y == 0 && x != 0 || x == 0 && y != 0
        map[y + 1][x + 1] = 1
      else
        map[y + 1][x + 1] = map[y][x + 1] + map[y + 1][x]
      end
    end
  end

  map[n][m]
end

p unique_paths(99, 1)
