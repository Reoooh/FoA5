# right = [10, 12, 20, 27]
# left  = [13, 15, 22, 25]
# u     = left.length - 1
# v     = right.length  - 1
# empty = Array.new(u + v)

def merge(array_u, array_v)
  i      = 0
  j      = 0
  k      = 0
  u      = array_u.length - 1
  v      = array_v.length - 1
  output = Array.new(array_u.length + array_v.length)
  while i <= u && j <= v
    if array_u[i] < array_v[j]
      output[k] = array_u[i]
      i += 1
    else
      output[k] = array_v[j]
      j += 1
    end
    k += 1
  end

  if i > u
    array_v[j..-1].each do |n|
      output[k] = n
      k += 1
    end
  else
    array_u[i..-1].each do |n|
      output[k] = n
      k += 1
    end
  end
  p output
end

def mergesort(s)
  n = s.length
  return s if n <= 1

  left  = s.take(s.size/2)
  right = s.drop(s.size/2)
  p left
  p right

  sorted_left  = mergesort(left)
  sorted_right = mergesort(right)
  merge(sorted_left, sorted_right)
end

s_array = [27, 10, 12, 20, 25, 13, 15, 22]
mergesort(s_array)

=begin
# https://gist.github.com/bih/9726300
class MergeSortAlgorithm
  # Break's the array down into two numbers (number A and number B) and sorts them.
  def sort(numbers)
    if numbers.size <= 1
      return numbers
    end

    array_size   = numbers.size
    half_of_size = (array_size / 2).round

    left_array  = numbers.take(half_of_size)
    right_array = numbers.drop(half_of_size)

    sorted_left_array = sort(left_array)
    sorted_right_array = sort(right_array)

    merge(sorted_left_array, sorted_right_array)
  end

  # This then creates a new array, loops through the left/right arrays and places the lowest number into the array. 
  def merge(left_array, right_array)
    if right_array.empty?
      return left_array # We have nothing to compare. Left wins.
    end

    if left_array.empty?
      return right_array # We have nothing to compare. Right wins.
    end

    smallest_number = if left_array.first <= right_array.first
      left_array.shift
    else
      right_array.shift
    end

    # We keep doing it until the left or right array is empty.
    recursive = merge(left_array, right_array)

    # Okay, either left or right array are empty at this point. So we have a result.
    [smallest_number].concat(recursive)
  end
end

# Let's give this a spin?
merge_sort = MergeSortAlgorithm.new
p merge_sort.sort([4, 92, 1, 39, 19, 93, 49, 10].shuffle)
=end
