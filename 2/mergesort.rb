# better one: https://gist.github.com/bih/9726300

def merge(array_u, array_v)
  i,j,k = 0,0,0
  u = array_u.length - 1
  v = array_v.length - 1
  array_s = Array.new

  while i <= u && j <= v
    if array_u[i] < array_v[j]
      array_s << array_u[i]
      i += 1
    else
      array_s << array_v[j]
      j += 1
    end
    k += 1
  end

  if i > u
    array_s.concat(array_v[j..-1])
  else
    array_s.concat(array_u[i..-1])
  end
end

def mergesort(array_s)
  if array_s.length > 1
    left  = array_s.take(array_s.size/2)
    right = array_s.drop(array_s.size/2)

    sorted_left  = mergesort(left)
    sorted_right = mergesort(right)

    merge(sorted_left, sorted_right)
  else
    return array_s
  end
end

s = [27, 10, 12, 20, 25, 13, 15, 22]
p mergesort(s)
