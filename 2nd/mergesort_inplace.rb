$s_array = [27, 10, 12, 20, 25, 13, 15, 22]
$n       = $s_array.length

def merge(low, mid, high)
  memory = Array.new(high+1)
  i      = low
  j      = mid + 1
  k      = low
  while i <= mid && j <= high
    if $s_array[i] < $s_array[j]
      memory[k] = $s_array[i]
      i += 1
    else
      memory[k] = $s_array[j]
      j += 1
    end
    k += 1
  end
  if i > mid
    $s_array[j..high].each do |n|
      memory[k] = n
      k += 1
    end
  else
    $s_array[i..mid].each do |n|
      memory[k] = n
      k += 1
    end
  end
  $s_array[low..high] = memory[low..high]
  p $s_array
  p memory
end

# merge(0, 3, 7)

def mergesort(low, high)
  if low < high
    mid = (low+high)/2
    mergesort(low, mid)
    mergesort(mid+1, high)
    merge(low, mid, high)
  end
end

mergesort(0, $n-1)