def schedule(array_d)
  n = array_d.length
  array_k = []  # 验证序列
  array_j = [1] # 最优序列

  (2..n).each do |i|
    array_k = array_j.sort.clone
    array_k << i

    feasibility_check = [] # 可行性检测
    array_k.each { |j| feasibility_check << [j, array_d[j - 1]] }
    feasibility_check.sort! { |x, y| x[1] <=> y[1] }

    feasible = true
    feasibility_check.length.times { |m| feasible = false if m + 1 > feasibility_check[m][1] }
    if feasible
      array_j.clear
      feasibility_check.each { |k| array_j << k[0] }
    end
  end

  p array_j
end

deadline = [3, 1, 1, 3, 3, 1, 3, 2] # 在标记任务前，已经对其进行了排序
schedule(deadline)
