def binsearch(s,x)
  low = 1
  high = s.length
  location = 0
  while low <= high && location == 0
    mid = (low+high)/2
    if x == s[mid-1]
      location = mid
    elsif x < [mid-1]
      high = mid - 1
    else
      low = mid + 1
    end
  end
  puts location
end

S = [9,1,8,2,7,3,6,4,5]
x = 5
S.sort!

binsearch(S,x)