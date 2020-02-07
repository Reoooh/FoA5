a = [9,1,8,2,7,3,6,4,5]
x = 5
a.sort!
low = 1
high = a.length
location = 0
while low <= high && location == 0
  mid = (low+high)/2
  if x==a[mid-1]
    location = mid
  elsif x<a[mid-1]
    high = mid - 1
  else
    low = mid + 1
  end
end
puts location