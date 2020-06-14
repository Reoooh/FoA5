require 'matrix'
# doc: https://ruby-doc.org/stdlib-2.7.1/libdoc/matrix/rdoc/index.html

# Matrix对象无法使用 length&size 方法
# 由于 Matrix.rank 方法会产生错误结果因此自行编写 size 方法
def matrix_size(input_matrix)
  
  matrixsize = 0
  input_matrix.each { matrixsize += 1 }
  Math.sqrt(matrixsize).to_i
end

# 仅在矩阵阶数为1时使用
def matrix_multiply(matrix_a, matrix_b)

  matrix = Matrix.build(1){ matrix_a[0,0] * matrix_b[0,0] }
  matrix
end

# 合并四个同阶NxN矩阵
def assemble(matrix_a, matrix_b, matrix_c, matrix_d)
  
  n = matrix_size(matrix_a)
  matrix = Matrix.build(n*2){nil}
  n.times do |i|
    n.times do |j|
      matrix[i,j]     = matrix_a[i,j]
      matrix[i,j+n]   = matrix_b[i,j]
      matrix[i+n,j]   = matrix_c[i,j]
      matrix[i+n,j+n] = matrix_d[i,j]
    end
  end
  matrix
end

# 拆分四个同阶NxN矩阵
def disassemble_1_1(input_matrix)

  n = matrix_size(input_matrix)
  matrix = Matrix.build(n/2){nil}
  (n/2).times do |i|
    (n/2).times do |j|
      matrix[i,j] = input_matrix[i,j]
    end
  end
  matrix
end

def disassemble_1_2(input_matrix)
  
  n = matrix_size(input_matrix)
  matrix = Matrix.build(n/2){nil}
  (n/2).times do |i|
    (n/2).times do |j|
      matrix[i,j] = input_matrix[i,j+n/2]
    end
  end
  matrix
end

def disassemble_2_1(input_matrix)
  
  n = matrix_size(input_matrix)
  matrix = Matrix.build(n/2){nil}
  (n/2).times do |i|
    (n/2).times do |j|
      matrix[i,j] = input_matrix[i+n/2,j]
    end
  end
  matrix
end

def disassemble_2_2(input_matrix)
  
  n = matrix_size(input_matrix)
  matrix = Matrix.build(n/2){nil}
  (n/2).times do |i|
    (n/2).times do |j|
      matrix[i,j] = input_matrix[i+n/2,j+n/2]
    end
  end
  matrix
end

# Strassen矩阵乘法适用于同阶NxN矩阵且N必须为2的n次幂
def strassen(matrix_a, matrix_b)
  
  if matrix_size(matrix_a) <= 1
    # 使用标准算法计算C=A*B
    matrix_multiply(matrix_a, matrix_b)
  else
    # 将A，B分为4个子矩阵
    a11 = disassemble_1_1(matrix_a)
    a12 = disassemble_1_2(matrix_a)
    a21 = disassemble_2_1(matrix_a)
    a22 = disassemble_2_2(matrix_a)
    
    b11 = disassemble_1_1(matrix_b)
    b12 = disassemble_1_2(matrix_b)
    b21 = disassemble_2_1(matrix_b)
    b22 = disassemble_2_2(matrix_b)
    
    # Strassen方法计算C=A*B
    m1  = strassen((a11+a22), (b11+b22))
    m2  = strassen((a21+a22), (b11))
    m3  = strassen((a11), (b12-b22))
    m4  = strassen((a22), (b21-b11))
    m5  = strassen((a11+a12), (b22))
    m6  = strassen((a21-a11), (b11+b12))
    m7  = strassen((a12-a22), (b21+b22))
    
    c11 = m1+m4-m5+m7
    c12 = m3+m5
    c21 = m2+m4
    c22 = m1+m3-m2+m6
    
    c   = assemble(c11,c12,c21,c22)
    c
  end
end

# a = Matrix[[2,3],[4,1]]
# b = Matrix[[5,7],[6,8]]
a = Matrix[[1,2,3,4],[5,6,7,8],[9,1,2,3],[4,5,6,7]]
b = Matrix[[8,9,1,2],[3,4,5,6],[7,8,9,1],[2,3,4,5]]

p strassen(a,b)