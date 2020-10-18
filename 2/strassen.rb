# frozen_string_literal: true

=begin
# 使用标准矩阵算法以检测结果
# a[0].length = b.length

a = [[2,3],[4,1]]
b = [[5,7],[6,8]]
#c = Array.new(a.length, Array.new(b[0].length, 0))
c = Array.new(a.length){Array.new(b[0].length, 0)}
p c

for i in 0..(a.length-1)
  for j in 0..(b[0].length-1)
    b.length.times do |k|
      c[i][j] += a[i][k]*b[k][j]
    end
  end
end
p c
=end

a = [[1, 2, 3, 4], [5, 6, 7, 8], [9, 1, 2, 3], [4, 5, 6, 7]]
b = [[8, 9, 1, 2], [3, 4, 5, 6], [7, 8, 9, 1], [2, 3, 4, 5]]
# a = [[2,3],[4,1]]
# b = [[5,7],[6,8]]

# 同阶NxN矩阵相加
def matrix_add(matrix_a, matrix_b)
  matrix = Array.new(matrix_a.length) { Array.new(matrix_a.length) }
  matrix.length.times do |i|
    matrix.length.times do |j|
      matrix[i][j] = matrix_a[i][j] + matrix_b[i][j]
    end
  end
  matrix
end

# 同阶NxN矩阵相减
def matrix_minus(matrix_a, matrix_b)
  matrix = Array.new(matrix_a.length) { Array.new(matrix_a.length) }
  matrix.length.times do |i|
    matrix.length.times do |j|
      matrix[i][j] = matrix_a[i][j] - matrix_b[i][j]
    end
  end
  matrix
end

# 仅在矩阵阶数为1时使用
def matrix_multiply(matrix_a, matrix_b)
  matrix = Array.new(matrix_a.length) { Array.new(matrix_a.length) }
  matrix.length.times do |i|
    matrix.length.times do |j|
      matrix[i][j] = matrix_a[i][j] * matrix_b[i][j]
    end
  end
  matrix
end

# p matrix_add(a,b)
# p matrix_minus(a,b)
# p matrix_multiply([[2]],[[3]])

# 合并四个NxN矩阵
def matrix_combine(matrix_a, matrix_b, matrix_c, matrix_d)
  matrix = Array.new(matrix_a.length * 2) { Array.new(matrix_a.length * 2) }
  matrix_a.length.times do |i|
    matrix_a.length.times do |j|
      matrix[i][j] = matrix_a[i][j]
    end
  end
  matrix_b.length.times do |i|
    matrix_b.length.times do |j|
      matrix[i][j + matrix_b.length] = matrix_b[i][j]
    end
  end
  matrix_c.length.times do |i|
    matrix_b.length.times do |j|
      matrix[i + matrix_b.length][j] = matrix_c[i][j]
    end
  end
  matrix_d.length.times do |i|
    matrix_d.length.times do |j|
      matrix[i + matrix_b.length][j + matrix_b.length] = matrix_d[i][j]
    end
  end
  matrix
end

# p matrix_combine([[1]],[[2]],[[3]],[[4]])
# p matrix_combine([[2,3],[4,1]],[[5,7],[6,8]],[[5,7],[6,8]],[[2,3],[4,1]])

def strassen(matrix_a, matrix_b)
  if matrix_a.length <= 1
    # 使用标准算法计算C=A*B
    matrix_multiply(matrix_a, matrix_b)
  else
    # 将A，B分为4个子矩阵
    a11 = Array.new(matrix_a.length / 2) { Array.new(matrix_a.length / 2) }
    a11.length.times do |i|
      a11.length.times do |j|
        a11[i][j] = matrix_a[i][j]
      end
    end
    a12 = Array.new(matrix_a.length / 2) { Array.new(matrix_a.length / 2) }
    a12.length.times do |i|
      a12.length.times do |j|
        a12[i][j] = matrix_a[i][j + matrix_a.length / 2]
      end
    end
    a21 = Array.new(matrix_a.length / 2) { Array.new(matrix_a.length / 2) }
    a21.length.times do |i|
      a21.length.times do |j|
        a21[i][j] = matrix_a[i + matrix_a.length / 2][j]
      end
    end
    a22 = Array.new(matrix_a.length / 2) { Array.new(matrix_a.length / 2) }
    a22.length.times do |i|
      a22.length.times do |j|
        a22[i][j] = matrix_a[i + matrix_a.length / 2][j + matrix_a.length / 2]
      end
    end

    b11 = Array.new(matrix_b.length / 2) { Array.new(matrix_b.length / 2) }
    b11.length.times do |i|
      b11.length.times do |j|
        b11[i][j] = matrix_b[i][j]
      end
    end
    b12 = Array.new(matrix_b.length / 2) { Array.new(matrix_b.length / 2) }
    b12.length.times do |i|
      b12.length.times do |j|
        b12[i][j] = matrix_b[i][j + matrix_b.length / 2]
      end
    end
    b21 = Array.new(matrix_b.length / 2) { Array.new(matrix_b.length / 2) }
    b21.length.times do |i|
      b21.length.times do |j|
        b21[i][j] = matrix_b[i + matrix_b.length / 2][j]
      end
    end
    b22 = Array.new(matrix_b.length / 2) { Array.new(matrix_b.length / 2) }
    b22.length.times do |i|
      b22.length.times do |j|
        b22[i][j] = matrix_b[i + matrix_b.length / 2][j + matrix_b.length / 2]
      end
    end
    # Strassen方法计算C=A*B
    m1 = strassen(matrix_add(a11, a22), matrix_add(b11, b22))
    m2 = strassen(matrix_add(a21, a22), b11)
    m3 = strassen(a11, matrix_minus(b12, b22))
    m4 = strassen(a22, matrix_minus(b21, b11))
    m5 = strassen(matrix_add(a11, a12), b22)
    m6 = strassen(matrix_minus(a21, a11), matrix_add(b11, b12))
    m7 = strassen(matrix_minus(a12, a22), matrix_add(b21, b22))

    c11 = matrix_add(matrix_minus(matrix_add(m1, m4), m5), m7)
    c12 = matrix_add(m3, m5)
    c21 = matrix_add(m2, m4)
    c22 = matrix_add(matrix_minus(matrix_add(m1, m3), m2), m6)

    c = matrix_combine(c11, c12, c21, c22)
    c
  end
  # p a11,a12,a21,a22
  # p b11,b12,b21,b22
end

p strassen(a, b)

# the better one
# require 'matrix'
