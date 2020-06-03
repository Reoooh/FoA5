$s_array = [15, 22, 13, 27, 12, 10, 20, 25]

def partition(low, high)
  pivotitem = $s_array[low]
  j = low
  (low+1..high).each do |i|
    if $s_array[i] < pivotitem
      j += 1
      $s_array[i],$s_array[j] = $s_array[j],$s_array[i]
    end
    # p $s_array
  end
  pivotpoint = j
  $s_array[low],$s_array[pivotpoint] = $s_array[pivotpoint],$s_array[low]
  # p $s_array
  pivotpoint
end

# partition(0, $s_array.length-1)

def quicksort(low, high)
  if high > low
    pivotpoint = partition(low, high)
    quicksort(low, pivotpoint-1)
    quicksort(pivotpoint+1, high)
  end
end

quicksort(0, $s_array.length-1)
p $s_array
