# Recursion
=begin
def fib(n)
  if n==1
    1
  elsif n==2
    1
  else
    fib(n-1)+fib(n-2)
  end
end

def fib(n)
  if n<=1
    n
  else
    fib(n-1)+fib(n-2)
  end
end
=end

# Iteration
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
