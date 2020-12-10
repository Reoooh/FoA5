$S = [27, 10, 12, 20, 25, 13, 15, 22]

def merge(low, mid, high)
  u = Array.new(high+1)
  i,k = low,low
  j = mid + 1

  while i <= mid && j <= high
    if $S[i] < $S[j]
      u[k] = $S[i]
      i += 1
    else
      u[k] = $S[j]
      j += 1
    end
    k += 1
  end
  if i > mid
    $S[j..high].each do |n|
      u[k] = n
      k += 1
    end
  else
    $S[i..mid].each do |n|
      u[k] = n
      k += 1
    end
  end
  $S[low..high] = u[low..high]
end

def mergesort(low, high)
  if low < high
    mid = (low+high)/2
    mergesort(low, mid)
    mergesort(mid+1, high)
    merge(low, mid, high)
  end
end

p mergesort(0, $S.size-1)
