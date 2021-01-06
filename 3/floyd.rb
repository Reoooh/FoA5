infinite = Float::INFINITY
adjacency_matrix = [[0, 1, infinite, 1, 5], [9, 0, 3, 2, infinite], [infinite, infinite, 0, 4, infinite], [infinite, infinite, 2, 0, 3], [3, infinite, infinite, infinite, 0]]
$p = [[0, 0, 4, 0, 4], [5, 0, 0, 0, 4], [5, 5, 0, 0, 4], [5, 5, 0, 0, 0], [0, 1, 4, 1, 0]]

def floyd(w)
  n = w.size - 1
  d = []
  w.each { |m| d << m.clone }

  (0..n).each do |k|
    (0..n).each do |i|
      (0..n).each do |j|
        d[i][j] = [d[i][j], d[i][k] + d[k][j]].min
      end
    end
  end

  d
end

def floyd2(w)
  n = w.size - 1
  p = Array.new(n + 1) { Array.new(n + 1) { 0 } }
  d = []
  w.each { |m| d << m.clone }

  (0..n).each do |k|
    (0..n).each do |i|
      (0..n).each do |j|
        if d[i][k] + d[k][j] < d[i][j]
          p[i][j] = k + 1
          d[i][j] = d[i][k] + d[k][j]
        end
      end
    end
  end

  p
end

def path(q, r)
  if $p[q - 1][r - 1] != 0
    path(q, $p[q - 1][r - 1])
    puts "v#{$p[q - 1][r - 1]}"
    path($p[q - 1][r - 1], r)
  end
end

p floyd(adjacency_matrix)
p floyd2(adjacency_matrix)

path(5, 3)
