def queens(i)
  if promising(i)
    if i == $n - 1
      puts "#{$col}"
    else
      (1..$n).each do |j|
        $col[i + 1] = j - 1
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
queens(-1)  # -1 作为顶级调用参数
