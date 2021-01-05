infinite = Float::INFINITY
adjacency_matrix = [[0, 1, infinite, 1, 5], [9, 0, 3, 2, infinite], [infinite, infinite, 0, 4, infinite], [infinite, infinite, 2, 0, 3], [3, infinite, infinite, infinite, 0]]

def floyd(w)
  n = w.size - 1
  d = w

  (0..n).each do |k|
    (0..n).each do |i|
      (0..n).each do |j|
        d[i][j] = [d[i][j], d[i][k] + d[k][j]].min
      end
    end
  end

  d
end

p floyd(adjacency_matrix)
