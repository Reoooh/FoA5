def prim(array_w)
  array_f  = []
  nearest  = []
  distance = []
  n = array_w.length

  (0..n - 1).each do |i|
    nearest[i]  = 1
    distance[i] = array_w[0][i]
  end

  (n - 1).times do
    min   = Float::INFINITY
    vnear = nil
    (1..n - 1).each do |i|
      if distance[i] > 0 && distance[i] < min
        min   = distance[i]
        vnear = i
      end
    end

    e = "v#{nearest[vnear]} -> v#{vnear + 1}"
    array_f << e
    distance[vnear] = -1

    (1..n - 1).each do |i|
      if distance[i] > array_w[i][vnear]
        distance[i] = array_w[i][vnear]
        nearest[i]  = vnear + 1
      end
    end
  end

  array_f
end

infinite = Float::INFINITY
adjacency_matrix = [[0, 1, 3, infinite, infinite], [1, 0, 3, 6, infinite], [3, 3, 0, 4, 2], [infinite, 6, 4, 0, 5], [infinite, infinite, 2, 5, 0]] # 连通加权无向图的邻接矩阵
p prim(adjacency_matrix)
