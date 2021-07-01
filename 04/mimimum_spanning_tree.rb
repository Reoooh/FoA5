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

def kruskal(array_w)
  n = array_w.length
  array_u = Array(0..n - 1)
  array_m = []
  array_f = []

  (0..n - 1).each do |i|
    (i + 1..n - 1).each do |j|
      array_m << [array_w[i][j], [i, j]] if array_w[i][j] != Float::INFINITY
    end
  end
  array_m.sort!

  while array_f.length < n - 1
    e = array_m[0]
    i = e[1][0]
    j = e[1][1]
    sp_p = find(i, array_u)
    sp_q = find(j, array_u)
    if sp_p != sp_q
      merge(sp_p, sp_q, array_u)
      array_f << "v#{i + 1} -> v#{j + 1}"
    end
    array_m.shift
  end

  array_f
end

def find(i, u)
  j = i
  j = u[j] while u[j] != j
  j
end

def merge(set_pointer_p, set_pointer_q, u)
  if set_pointer_p < set_pointer_q
    u[set_pointer_q] = set_pointer_p
  else
    u[set_pointer_p] = q
  end
end

infinite = Float::INFINITY
adjacency_matrix = [[0, 1, 3, infinite, infinite], [1, 0, 3, 6, infinite], [3, 3, 0, 4, 2], [infinite, 6, 4, 0, 5], [infinite, infinite, 2, 5, 0]] # 连通加权无向图的邻接矩阵
p prim(adjacency_matrix)
p kruskal(adjacency_matrix)
