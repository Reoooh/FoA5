def schedule(array_d)
  n = array_d.length
  array_k = []
  array_j = [1]

  (2..n).each do |i|
    array_k = array_j.clone
    array_k << i

    feasibility_check = []
    array_k.each { |j| feasibility_check << [j, array_d[j - 1]] }
    feasibility_check.sort! { |x, y| x[1] <=> y[1] }

    easibility = true
    feasibility_check.length.times do |m|
      easibility = false if m + 1 > feasibility_check[m][1]
    end
    array_j = array_k.clone if easibility
  end

  array_j
end

deadline = [3, 1, 1, 3, 3, 1, 3, 2] # 在标记任务前，已经对其进行了排序
p schedule(deadline)
