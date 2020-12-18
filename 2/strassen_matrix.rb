require 'matrix'
# doc: https://ruby-doc.org/stdlib-2.7.1/libdoc/matrix/rdoc/index.html
# Strassen矩阵乘法适用于可以分别划分为四个子矩阵的大型矩阵（阶为2的幂的单位矩阵）

def segment(matrix_input, part)
  matrix = Matrix.build(matrix_input.row_size / 2) { nil }
  case part
  when 11
    m = 0
    n = 0
  when 12
    m = 0
    n = matrix_input.row_size / 2
  when 21
    m = matrix_input.row_size / 2
    n = 0
  else
    m = matrix_input.row_size / 2
    n = matrix_input.row_size / 2
  end
  (matrix_input.row_size / 2).times do |i|
    (matrix_input.row_size / 2).times do |j|
      matrix[i, j] = matrix_input[i + m, j + n]
    end
  end
  matrix
end

def strassen(matrix_a, matrix_b)
  if matrix_a.row_size <= 1 # 暂令threshold = 1
    matrix = matrix_a * matrix_b
    matrix
  else
    a11 = segment(matrix_a, 11)
    a12 = segment(matrix_a, 12)
    a21 = segment(matrix_a, 21)
    a22 = segment(matrix_a, 22)
    b11 = segment(matrix_b, 11)
    b12 = segment(matrix_b, 12)
    b21 = segment(matrix_b, 21)
    b22 = segment(matrix_b, 22)

    m1  = strassen(a11 + a22, b11 + b22)
    m2  = strassen(a21 + a22, b11)
    m3  = strassen(a11, b12 - b22)
    m4  = strassen(a22, b21 - b11)
    m5  = strassen(a11 + a12, b22)
    m6  = strassen(a21 - a11, b11 + b12)
    m7  = strassen(a12 - a22, b21 + b22)

    c11 = m1 + m4 - m5 + m7
    c12 = m3 + m5
    c21 = m2 + m4
    c22 = m1 + m3 - m2 + m6

    c = c11.hstack(c12).vstack(c21.hstack(c22))
    c
  end
end

# a = Matrix[[2,3],[4,1]]
# b = Matrix[[5,7],[6,8]]
a = Matrix[[1, 2, 3, 4], [5, 6, 7, 8], [9, 1, 2, 3], [4, 5, 6, 7]]
b = Matrix[[8, 9, 1, 2], [3, 4, 5, 6], [7, 8, 9, 1], [2, 3, 4, 5]]
p strassen(a, b)
