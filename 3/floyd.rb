def floyd(matrix_w)
  n = matrix_w.size - 1
  matrix_d = []
  matrix_w.each { |m| matrix_d << m.clone }

  (0..n).each do |k|
    (0..n).each do |i|
      (0..n).each do |j|
        matrix_d[i][j] = [matrix_d[i][j], matrix_d[i][k] + matrix_d[k][j]].min
      end
    end
  end

  matrix_d
end

def floyd2(matrix_w)
  n = matrix_w.size - 1
  matrix_p = Array.new(n + 1) { Array.new(n + 1) { 0 } }
  matrix_d = []
  matrix_w.each { |m| matrix_d << m.clone }

  (0..n).each do |k|
    (0..n).each do |i|
      (0..n).each do |j|
        if matrix_d[i][k] + matrix_d[k][j] < matrix_d[i][j]
          matrix_p[i][j] = k + 1
          matrix_d[i][j] = matrix_d[i][k] + matrix_d[k][j]
        end
      end
    end
  end

  matrix_p
end

def path(q, r)
  if $P[q - 1][r - 1] != 0
    path(q, $P[q - 1][r - 1])
    puts "v#{$P[q - 1][r - 1]}"
    path($P[q - 1][r - 1], r)
  end
end

infinite = Float::INFINITY
adjacency_matrix = [[0, 1, infinite, 1, 5], [9, 0, 3, 2, infinite], [infinite, infinite, 0, 4, infinite], [infinite, infinite, 2, 0, 3], [3, infinite, infinite, infinite, 0]]
p floyd(adjacency_matrix)
p floyd2(adjacency_matrix)

$P = [[0, 0, 4, 0, 4], [5, 0, 0, 0, 4], [5, 5, 0, 0, 4], [5, 5, 0, 0, 0], [0, 1, 4, 1, 0]]
path(5, 3)
