def prod(u, v)
  n = [u.abs.to_s.length, v.abs.to_s.length].max
  if u == 0 || v == 0
    0
  elsif n <= 2
    u * v
  else
    m = n / 2

    x = u.quo(10**m).to_i   # 针对可能负数情况：Rational类商转换为Int类
    y = u.remainder(10**m)  # 取与被除数符号相同的余数
    w = v.quo(10**m).to_i
    z = v.remainder(10**m)

    prod(x, w) * 10**(2 * m) + (prod(x, z) + prod(w, y)) * 10**m + prod(y, z)
  end
end

def prod2(u, v)
  n = [u.abs.to_s.length, v.abs.to_s.length].max
  if u == 0 || v == 0
    0
  elsif n <= 2
    u * v
  else
    m = n / 2

    x = u.quo(10**m).to_i
    y = u.remainder(10**m)
    w = v.quo(10**m).to_i
    z = v.remainder(10**m)

    r = prod2(x + y, w + z)
    p = prod2(x, w)
    q = prod2(y, z)

    p * (10**(2 * m)) + (r - p - q) * 10**m + q
  end
end

a = 567_832
b = -9_423_723
p prod(a, b)
p prod2(a, b)
