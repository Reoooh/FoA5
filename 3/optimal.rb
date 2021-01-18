def opt(i, j)
  m = $x.size
  n = $y.size

  if i == m - 1
    return 2 * (n - j)
  elsif j == n - 1
    return 2 * (m - i)
  else
    if $x[i] == $y[j]
      penalty = 0
    else
      penalty = 1
    end
    optimal_cost = [opt(i + 1, j + 1) + penalty, opt(i + 1, j) + 2, opt(i, j + 1) + 2].min
  end

  optimal_cost
end

$x = %w[A A C A G T T A C C]
$y = %w[T A A G G T C A]
p opt(0, 0)
