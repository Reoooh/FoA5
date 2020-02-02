ru = "Ruby"
py = String.new

def ru.hi
  puts "Hello #{self}"
end

def py.hi
  puts "Hello Python"
end

ru.hi
puts ru.hi
# 由于puts返回值为nil 因此会输出空行
py.hi

if puts "1st"
  puts "2nd"
end

p ru.respond_to?("hi")
p ru.methods.sort
