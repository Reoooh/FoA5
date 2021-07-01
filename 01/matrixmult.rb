# a[0].length = b.length

a = [[2,3],[4,1]]
b = [[5,7],[6,8]]
#c = Array.new(a.length, Array.new(b[0].length, 0))
c = Array.new(a.length){Array.new(b[0].length, 0)}

for i in 0..(a.length-1)
  for j in 0..(b[0].length-1)
    b.length.times do |k|
      c[i][j] += a[i][k]*b[k][j]
    end
  end
end
p c