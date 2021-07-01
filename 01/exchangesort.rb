S = [1,3,5,7,9]
n = S.length
(0..n-1).each do |i|
  (i+1..n-1).each do |j|
    puts "#{S[i]},#{S[j]}"
    if S[j] > S[i]
      S[i],S[j] = S[j],S[i]
    end
  end
end
p S