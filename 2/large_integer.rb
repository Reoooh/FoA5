def prod(u, v)
  n = [u.abs.to_s.length, v.abs.to_s.length].max
  if u == 0 || v == 0
    0
  elsif n <= 2
    u * v
  else
    m = n / 2
                            # 针对负数情况
    x = u.quo(10**m).to_i   # Rational类商转换为Int类
    y = u.remainder(10**m)  # 与被除数符号相同的余数
    w = v.quo(10**m).to_i
    z = v.remainder(10**m)

    prod(x, w) * 10**(2 * m) + (prod(x, z) + prod(w, y)) * 10**m + prod(y, z)
  end
end

a = 567_832
b = 9_423_723
p prod(a, b)
