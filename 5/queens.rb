def queens(i)
  if promising(i)
    if i == $n - 1
      p $col
    else
      (0..$n - 1).each do |j|
        $col[i + 1] = j
        queens(i + 1)
      end
    end
  end
end

def promising(i)
  k = 0
  switch = true
  while k < i && switch
    switch = false if $col[i] == $col[k] || ($col[i] - $col[k]).abs == i - k
    k += 1
  end
  switch
end

$n   = 4    # 暂令 n = 4
$col = [0]  # col 与 n 非递归输入，因此定为全局变量
queens(-1)
