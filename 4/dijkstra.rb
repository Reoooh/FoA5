def dijkstra(array_w)
  array_f = []
  touch   = []
  length  = []
  n = array_w.length

  (0..n - 1).each do |i|
    touch[i]  = 1
    length[i] = array_w[0][i]
  end

  (n - 1).times do
    min   = Float::INFINITY
    vnear = nil
    (1..n - 1).each do |i|
      if length[i] > 0 && length[i] < min
        min   = length[i]
        vnear = i
      end
    end

    e = "v#{touch[vnear]} -> v#{vnear + 1}"
    array_f << e

    (1..n - 1).each do |i|
      if length[vnear] + array_w[vnear][i] < length[i]
        touch[i]  = vnear + 1
        length[i] = length[vnear] + array_w[vnear][i]
      end
    end

    length[vnear] = -1
  end

  array_f
end

infinite = Float::INFINITY
adjacency_matrix = [[0, 7, 4, 6, 1], [infinite, 0, infinite, infinite, infinite], [infinite, 2, 0, 5, infinite],
                    [infinite, 3, infinite, 0, infinite], [infinite, infinite, infinite, 1, 0]]
p dijkstra(adjacency_matrix)
