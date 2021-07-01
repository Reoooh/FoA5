def m_coloring(i)
  if promising(i)
    if i == $n - 1
      p $vcolor
    else
      (1..3).each do |color|  # 令 m = 3
        $vcolor[i + 1] = color
        m_coloring(i + 1)
      end
    end
  end
end

def promising(i)
  switch = true
  j = 0
  while (j < i) & switch
    switch = false if $W[i][j] & ($vcolor[i] == $vcolor[j])
    j += 1
  end
  switch
end

$W = [[false, true, true, true], [true, false, true, false], [true, true, false, true], [true, false, true, false]]    # adjacency_matrix
$n = $W.length
$vcolor = Array.new($n)

m_coloring(-1)
