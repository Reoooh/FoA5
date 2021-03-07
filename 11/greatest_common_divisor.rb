def gcd(n, m)
  if m.zero?
    n
  else
    gcd(m, n % m)
  end
end

$i_j = []
def euclid(n, m)
  if m == 0
    $i_j = [1, 0]
    puts "gcd : #{n}"
  else
    euclid(m, n % m)
    i = $i_j[0]
    j = $i_j[1]
    $i_j[0] = j
    $i_j[1] = i - (n / m) * j
    $i_j
  end
end

p gcd(7_276_500, 3_185_325)
p euclid(42, 30)
