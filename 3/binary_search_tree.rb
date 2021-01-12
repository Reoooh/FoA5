class NodeType
  attr_reader :key
  attr_accessor :left, :right

  def initialize(key)
    @key = key
    @left = nil
    @right = nil
  end
end

def search(tree, keyin)
  found = false
  p = tree

  until found
    if p.key == keyin
      found = true
      puts "found #{p.key}"
    elsif keyin < p.key
      p = p.left
    else
      p = p.right
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
      matrix_r[i - 1][j] = minimum.key(matrix_a[i - 1][j])
    end
  end

  minavg = matrix_a[0][n]
  minavg
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

k1 = NodeType.new('Don')
k2 = NodeType.new('Isabelle')
k3 = NodeType.new('Ralph')
k4 = NodeType.new('Wally')

probability = [3/8r, 3/8r, 1/8r, 1/8r]

p optsearchtree(probability)
