def partition(low, high)
  j = low
  pivotitem = $array_s[low]

  (low + 1..high).each do |i|
    if $array_s[i] < pivotitem
      j += 1
      $array_s[i], $array_s[j] = $array_s[j], $array_s[i]
    end
  end

  pivotpoint = j
  $array_s[low], $array_s[pivotpoint] = $array_s[pivotpoint], $array_s[low]
  pivotpoint
end

def quicksort(low, high)
  if high > low
    pivotpoint = partition(low, high)
    quicksort(low, pivotpoint - 1)
    quicksort(pivotpoint + 1, high)
  end
end

$array_s = [15, 22, 13, 27, 12, 10, 20, 25]
quicksort(0, $array_s.length - 1)
p $array_s
