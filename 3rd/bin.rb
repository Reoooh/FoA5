# 使用分治的二项式系数计算

def bin(n, k)
  if k == 0 || n == k
    1
  else
    bin(n-1, k-1) + bin(n-1, k)
  end
end

# p bin(4, 2)