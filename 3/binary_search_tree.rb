class NodeType
  attr_reader :key
  attr_accessor :left, :right

  def initialize(key)
    @key = key
    @left, @right = nil, nil
  end
end

def search(tree, keyin)
  found = false
  nodetype_p = tree

  until found
    if nodetype_p.key == keyin
      found = true
      puts "found #{nodetype_p.key}"
    elsif keyin < nodetype_p.key  # 字符编码顺序决定字符串的大小
      nodetype_p = nodetype_p.left
    else
      nodetype_p = nodetype_p.right
    end
  end
end

def optsearchtree(array_p)
  n = array_p.size
  matrix_a = Array.new(n + 1) { Array.new(n + 1) }
  matrix_r = Array.new(n + 1) { Array.new(n + 1) }
  (0..n - 1).each do |i|
    matrix_a[i][i] = 0
    matrix_a[i][i + 1] = array_p[i]
    matrix_r[i][i + 1] = i + 1
    matrix_r[i][i] = 0
  end
  matrix_a[n][n] = 0
  matrix_r[n][n] = 0

  (1..n - 1).each do |diagonal|
    (1..n - diagonal).each do |i|
      j = i + diagonal

      minimum = {}
      (i..j).each { |k| minimum[k] = matrix_a[i - 1][k - 1] + matrix_a[k][j] + array_p[i - 1..j - 1].sum }
      matrix_a[i - 1][j] = minimum.values.min
      matrix_r[i - 1][j] = minimum.key(matrix_a[i - 1][j])  # 取最小k值
    end
  end

  matrix_a[0][n]
end

def tree(i, j)
  k = $R[i - 1][j]

  if k == 0
    nil
  else
    nodetype_p = NodeType.new($K[k - 1])
    nodetype_p.left  = tree(i, k - 1)
    nodetype_p.right = tree(k + 1, j)
    nodetype_p
  end
end

n1 = NodeType.new('Devia')
n2 = NodeType.new('Carmen')
n3 = NodeType.new('Ralph')
n4 = NodeType.new('Isabelle')
n5 = NodeType.new('Ursual')
n6 = NodeType.new('Tom')
n7 = NodeType.new('Wally')

n1.left  = n2
n1.right = n3
n3.left  = n4
n3.right = n5
n5.left  = n6
n5.right = n7

search(n1, 'Wally')

probability = [3/8r, 3/8r, 1/8r, 1/8r]
p optsearchtree(probability)

$R = [[0, 1, 1, 2, 2], [nil, 0, 2, 2, 2], [nil, nil, 0, 3, 3], [nil, nil, nil, 0, 4], [nil, nil, nil, nil, 0]]
$K = %w[Don Isabelle Ralph Wally]
p tree(1, $K.length)
