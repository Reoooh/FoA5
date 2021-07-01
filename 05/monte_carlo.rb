def estimate_n_queens(n)
  col = [0]
  i = 0
  numnodes = 1
  m = 1
  mprod = 1

  while m != 0 && i != n
    mprod *= m
    numnodes += mprod * n
    i += 1
    m = 0
    prom_children = []

    (1..n).each do |j|
      col[i - 1] = j - 1
      if promising(i - 1, col)
        m += 1
        prom_children |= [j - 1]
      end
    end
    if m != 0
      j = prom_children.sample
      col[i - 1] = j
    end
  end
  puts numnodes
end

def promising(i, col)
  k = 0
  switch = true
  while k < i && switch
    switch = false if col[i] == col[k] || (col[i] - col[k]).abs == i - k
    k += 1
  end
  switch
end

estimate_n_queens(4)
