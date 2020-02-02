s = [1,3,5,7,9]
n = s.length
(0..n-1).each do |i|
  (i+1..n-1).each do |j|
    puts "#{s[i]},#{s[j]}"
    if s[j] > s[i]
      s[i],s[j] = s[j],s[i]
    end
  end
end
p s