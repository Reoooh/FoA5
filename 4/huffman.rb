class NodeType
  attr_reader :symbol
  attr_accessor :frequency, :left, :right

  def initialize(frequency, symbol = 'default')
    @symbol     = symbol
    @frequency  = frequency
    @left       = nil
    @right      = nil
  end
end

def huffman(array_cs)
  n = array_cs.length
  array_cs.sort_by! { |_x, y| y }
  priority_queue = []
  array_cs.each do |character|
    nodetype_c = NodeType.new(character[1], character[0])
    priority_queue << nodetype_c
  end

  (n - 1).times do
    nodetype_r = NodeType.new(array_cs[0][1] + array_cs[1][1],'root')
    nodetype_r.left  = priority_queue[0]
    nodetype_r.right = priority_queue[1]

    root = ["#{array_cs[0][0]},#{array_cs[1][0]}", array_cs[0][1] + array_cs[1][1]]
    array_cs << root
    2.times { array_cs.shift }
    array_cs.sort_by! { |_x, y| y }
    location = array_cs.index(root)

    2.times { priority_queue.shift }
    priority_queue[location, 0] = nodetype_r
  end

  p priority_queue
end

def huffman_code(codes, node, tag = 'root', code = [])
    if node != nil
        if tag == 'left'
            code << 0
        elsif tag == 'right'
            code << 1
        else
            code
        end

        if node.symbol != 'root'
            codes << "#{node.symbol} : #{code}"
            code.pop
        end

        huffman_code(codes, node.left, 'left' , code)
        huffman_code(codes, node.right,'right', code)
    end
end

character_set = [['a', 16], ['b', 5], ['c', 12], ['d', 17], ['e', 10], ['f', 25]]
huffman(character_set)
