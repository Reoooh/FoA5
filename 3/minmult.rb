def minmult(array_d)
  n = array_d.size - 1
  matrix_m = Array.new(n) { Array.new(n) { 0 } }
  matrix_p = Array.new(n - 1) { Array.new(n) }

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

d = [5, 2, 3, 4, 6, 7, 8]
minmult(d)
