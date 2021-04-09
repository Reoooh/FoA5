def sum_of_subsets(i, weight, total)
  if promising(i, weight, total)
    if weight == $W
      p $include[0..i]
    else
      $include[i + 1] = 'yes'
      sum_of_subsets(i + 1, weight + $w[i + 1], total - $w[i + 1])
      $include[i + 1] = 'no'
      sum_of_subsets(i + 1, weight, total - $w[i + 1])
    end
  end
end

def promising(i, weight, total)
  if i < $n - 1
    (weight + total >= $W) & ((weight == $W) | (weight + $w[i + 1] <= $W))
  else
    (weight + total >= $W) & ((weight == $W) | (weight <= $W))  # 避免超出数组范围产生错误
  end
end

$w = [5, 6, 10, 11, 16].sort  # n、w、W、include 不是例程输入，因此定义为全局变量
$W = 21
$n = $w.length
$include = Array.new($n)

sum_of_subsets(-1, 0, $w.sum)
