# 使用分治的二项式系数计算

def bin(n, k)
  if k == 0 || n == k
    1
  else
    bin(n - 1, k - 1) + bin(n - 1, k)
  end
end

def bin2(n, k)
  b = Array.new(n + 1) { Array.new(k + 1) }

  (0..n).each do |i|
    (0..[i, k].min).each do |j|
      if j == 0 || j == i
        b[i][j] = 1
      else
        b[i][j] = b[i - 1][j - 1] + b[i - 1][j]
      end
    end
  end

  b[0][0] = 0
  b[n][k]
end

p bin(4, 2)
p bin2(4, 2)
