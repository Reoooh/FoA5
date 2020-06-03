def fib_a(n)
  if n==1
    1
  elsif n==2
    1
  else
    fib_a(n-1)+fib_a(n-2)
  end
end

# the better one
def fib_b(n)
  if n<=1
    n
  else
    fib_b(n-1)+fib_b(n-2)
  end
end

p fib_a(6)
p fib_b(6)
