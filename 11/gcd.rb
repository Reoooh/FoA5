def gcd(n, m)
  if m == 0
    n
  else
    gcd(m, n % m)
  end
end

p gcd(7_276_500, 3_185_325)
