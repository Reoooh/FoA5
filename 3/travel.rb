def travel(matrix_w)
    n = matrix_w.size
    # matrix_d = Array.new(n){Array.new(n)}
    hash_d = {}
    array_v = (1..n).to_a
    p array_v
    (1..n).each do |k|
        hash_d.store(k,{})
    end
    p hash_d

    array_a = [[]]
    array_v.each do |x|
        array_a.size.times do |y|
            array_a << (array_a[y] + [x])
        end
    end
    p array_a
    # array_a.delete([1])
    array_a.delete([])
    array_a.each do |m|
        array_a.delete(m) if m.include?(1)
    end
    p array_a


    # (1..n-1).each{|i| matrix_d[i][0] = matrix_w[i][0]}
    # p matrix_d
    # (1..n-1).each{|i| hash_d.store(:"#{i}",{nil: matrix_w[i][0]})
    (2..n).each do |i|
        hash_d[i].store(([]).to_s, matrix_w[i-1][0])
    end
    p hash_d
    (1..n-2).each do |k|
        
        array_a.find_all{|a_size| a_size.size == k}.each do |a|

            minimum = {}
            (2..n).each do |i|
                if a.include?(i)
                    next
                else
                    a.each do |j|
                        minimum[j] = matrix_w[i-1][j-1] + hash_d[j][(a-[j]).to_s]
                    end
                end
                hash_d[i][(a).to_s] = minimum.values.min
            end
            
        end
        
    end
    minimum = {}
    (array_v-[1]).each do |j|
        minimum[j] = matrix_w[0][j-1] + hash_d[j][(array_v-[1]-[j]).to_s]
    end
    hash_d[1][(array_v-[1]).to_s] = minimum.values.min
    p hash_d
end

infinite = Float::INFINITY
adjacency_matrix = [[0,2,9,infinite],[1,0,6,4],[infinite,7,0,8],[6,3,infinite,0]]
p adjacency_matrix
travel(adjacency_matrix)