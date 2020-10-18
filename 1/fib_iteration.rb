def fib(n)
  f = Array.new(n+1)
  f[0]=0
  if n>0
    f[1]=1
    (2..n).each do |i|
      f[i]=f[i-1]+f[i-2]
    end
  end
  f[n]
end

p fib(6)
