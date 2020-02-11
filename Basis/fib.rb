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
=end

def fib(n)
  if n<=1
    n
  else
    fib(n-1)+fib(n-2)
  end
end

p fib(6)

