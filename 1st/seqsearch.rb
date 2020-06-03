a = [1,2,3,4,5,4,3,2,1]
n = 1
location = 0
a.each do |m|
  location += 1
  puts location if m == n
end
