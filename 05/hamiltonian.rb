def hamiltonian(i)
  if promising(i)
    if i == $n - 1
      p $vindex
    else
      (2..$n).each do |j|
        $vindex[i + 1] = j
        hamiltonian(i + 1)
      end
    end
  end
end

def promising(i)
  if i == $n - 1 && !$W[$vindex[$n - 1] - 1][$vindex[0] - 1]
    switch = false
  elsif i.positive? && !$W[$vindex[i - 1] - 1][$vindex[i] - 1]
    switch = false
  else
    switch = true
    j = 1
    while j < i && switch
      switch = false if $vindex[i] == $vindex[j]
      j += 1
    end
  end
  switch
end

$W = [[false, true, true, false, false, false, true, true],
      [true, false, true, false, false, false, true, true],
      [true, true, false, true, false, true, false, false],
      [false, false, true, false, true, false, false, false],
      [false, false, false, true, false, true, false, false],
      [false, false, true, false, true, false, true, false],
      [true, true, false, false, false, true, false, true],
      [true, true, false, false, false, false, true, false]]	# adjacency_matrix
$n = $W.size
$vindex = Array.new($n)
$vindex[0] = 1  # 以硬编码方式规定v1作为起始顶点

hamiltonian(0)
