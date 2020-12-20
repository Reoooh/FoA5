def binsearch(low, high)
  if low > high
    0
  else
    mid = (low + high) / 2
    if $x > $S[mid - 1]
      binsearch(mid + 1, high)
    elsif $x < $S[mid - 1]
      binsearch(low, mid - 1)
    else
      mid
    end
  end
end

$S = [9, 1, 8, 2, 7, 3, 6, 4, 5]
$x = 5
$S.sort!

p binsearch(1, $S.length)
