def merge(low, mid, high)
  array_u = Array.new(high+1)
  i,k = low,low
  j = mid + 1

  while i <= mid && j <= high
    if $array_s[i] < $array_s[j]
      array_u[k] = $array_s[i]
      i += 1
    else
      array_u[k] = $array_s[j]
      j += 1
    end
    k += 1
  end

  if i > mid
    array_u[k..high] = $array_s[j..high]
  else
    array_u[k..high] = $array_s[i..high]
  end

  $array_s[low..high] = array_u[low..high]
end

def mergesort(low, high)
  if low < high
    mid = (low+high)/2
    mergesort(low, mid)
    mergesort(mid+1, high)
    merge(low, mid, high)
  end
end

$array_s = [27, 10, 12, 20, 25, 13, 15, 22]
p mergesort(0, $array_s.size-1)
