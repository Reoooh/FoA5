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
