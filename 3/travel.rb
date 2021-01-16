def travel(matrix_w)
  n = matrix_w.size
  array_v = (1..n).to_a

  array_a = [[]]
  array_v.each do |x|
    array_a.size.times do |y|
      array_a << (array_a[y] + [x])
    end
  end
  array_a.delete([])
  array_a.each { |m| array_a.delete(m) if m.include?(1) }

  hash_d = {}
  hash_p = {}
  array_v.each { |k| hash_d.store(k, {}) }
  array_v.each { |v| hash_p.store(v, {}) }

  (2..n).each { |i| hash_d[i].store([].to_s, matrix_w[i - 1][0]) }

  (1..n - 2).each do |k|
    array_a.find_all { |a_size| a_size.size == k }.each do |a|
      minimum = {}
      (2..n).each do |i|
        if a.include?(i)
          next
        else
          a.each { |j| minimum[j] = matrix_w[i - 1][j - 1] + hash_d[j][(a - [j]).to_s] }
        end

        hash_d[i][a.to_s] = minimum.values.min
        hash_p[i][a.to_s] = minimum.key(hash_d[i][a.to_s])
      end
    end
  end
  minimum = {}
  (array_v - [1]).each { |j| minimum[j] = matrix_w[0][j - 1] + hash_d[j][(array_v - [1] - [j]).to_s] }
  hash_d[1][(array_v - [1]).to_s] = minimum.values.min
  hash_p[1][(array_v - [1]).to_s] = minimum.key(hash_d[1][(array_v - [1]).to_s])

  p hash_d
  p hash_p
end

def path(hash_p)
  n = hash_p.size
  array_v = hash_p.keys
  best_path = []
  point = 1

  best_path << "v#{point}"
  array_v.delete(point)

  (n - 1).times do
    point = hash_p[point][array_v.to_s]
    best_path << "v#{point}"
    array_v.delete(point)
  end
  best_path << 'v1'
  p best_path
end

infinite = Float::INFINITY
adjacency_matrix = [[0, 2, 9, infinite], [1, 0, 6, 4], [infinite, 7, 0, 8], [6, 3, infinite, 0]]
travel(adjacency_matrix)

P = {1=>{"[2, 3, 4]"=>3}, 2=>{"[3]"=>3, "[4]"=>4, "[3, 4]"=>3}, 3=>{"[2]"=>2, "[4]"=>4, "[2, 4]"=>4}, 4=>{"[2]"=>2, "[3]"=>3, "[2, 3]"=>2}}
path(P)
