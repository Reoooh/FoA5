$S = [9,1,8,2,7,3,6,4,5]
$x = 9
$S.sort!

def location(low, high)
  if low > high
    0
  else
    mid = (low+high)/2
    if $x > $S[mid-1]
      return location(mid+1, high)
    elsif $x < $S[mid-1]
      return location(low, mid-1)
    else
      return mid
    end
  end
end

p location(1, $S.length)
