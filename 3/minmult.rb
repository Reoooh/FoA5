def minmult(array_d)
  n = array_d.size - 1
  matrix_m = Array.new(n) { Array.new(n) }
  matrix_p = Array.new(n - 1) { Array.new(n) }
  n.times { |i| matrix_m[i][i] = 0 }

  (1..n - 1).each do |diagonal|
    (1..n - diagonal).each do |i|
      j = i + diagonal

      minimum = {}
      (i..j - 1).each { |k| minimum[k] = matrix_m[i - 1][k - 1] + matrix_m[k][j - 1] + array_d[i - 1] * array_d[k] * array_d[j] }
      matrix_m[i - 1][j - 1] = minimum.values.min
      matrix_p[i - 1][j - 1] = minimum.key(matrix_m[i - 1][j - 1]) # 取最小k值
    end
  end

  p matrix_m
  p matrix_p
end

def order(i, j)
  if i == j
    print "A#{i}"
  else
    k = $P[i - 1][j - 1]
    print '('
    order(i, k)
    order(k + 1, j)
    print ')'
  end
end

d = [5, 2, 3, 4, 6, 7, 8]
minmult(d)

$P = [[nil, 1, 1, 1, 1, 1], [nil, nil, 2, 3, 4, 5], [nil, nil, nil, 3, 4, 5], [nil, nil, nil, nil, 4, 5], [nil, nil, nil, nil, nil, 5]]
order(1, 6)
