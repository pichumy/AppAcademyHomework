class DynamicProgramming

  def initialize
    @blair_cache = { 1 => 1, 2 => 2 }
    # @frog_cache = [ [[1]], [[1, 1], [2]], [[1, 1, 1], [1, 2], [2, 1], [3]]]
    @frog_cache = []
    @super_cache = []
    @knapsack_cache = [0]
  end

  def blair_nums(n)
    return @blair_cache[n] if @blair_cache[n]
    first_number = @blair_cache[n-1] || @blair_cache[n-1] = blair_nums(n-1)
    second_number = @blair_cache[n-2] || @blair_cache[n-2] = blair_nums(n-2)
    first_number + second_number + n_odd(n - 1)
  end

  def n_odd(n)
    i = 1
    odd_count = 1
    while odd_count < n
      i += 2
      odd_count += 1
    end
    i
  end

  def frog_hops_bottom_up(n)
    frog_cache_builder(n)
    @frog_cache[n - 1]
  end

  def deep_dup(array)
    results = []
    array.each do |el|
      if el.is_a?(Array)
        results.push(deep_dup(el))
      else
        results.push(el)
      end
    end
    results
  end

  def frog_cache_builder(n)
    idx = 3
    # Base cases
    @frog_cache = [ [[1]], [[1, 1], [2]], [[1, 1, 1], [1, 2], [2, 1], [3]]]
    while idx < n
        # Expansion algorithmn
        first = deep_dup(@frog_cache[idx - 1]).map { |set| set.push(1) }
        second = deep_dup(@frog_cache[idx - 2]).map { |set| set.push(2) }
        third = deep_dup(@frog_cache[idx - 3]).map { |set| set.push(3) }
        @frog_cache[idx] = first + second + third
        idx += 1
    end
    @frog_cache
  end

  def frog_hops_top_down(n)
    frog_hops_top_down_helper(n)
    @frog_cache[n - 1]
  end

  def frog_hops_top_down_helper(n)
    return @frog_cache[0] = [[1]] if n == 1
    return @frog_cache[1] = [[1, 1], [2]] if n == 2
    return @frog_cache[2] = [[1, 1, 1], [1, 2], [2, 1], [3]] if n == 3
    return if @frog_cache[n - 1]
    third = @frog_cache[n - 4] || frog_hops_top_down_helper(n - 3)
    second = @frog_cache[n - 3] || frog_hops_top_down_helper(n - 2)
    first = @frog_cache[n - 2] || frog_hops_top_down_helper(n - 1)
    part_1 = deep_dup(first).map { |set| set.push(1) }
    part_2 = deep_dup(second).map { |set| set.push(2) }
    part_3 = deep_dup(third).map { |set| set.push(3) }
    @frog_cache[n - 1] = part_1 + part_2 + part_3
  end
  # n = stairs, k = max_hop
  def super_frog_hops(n, k)
    super_top_down_helper(n, k)
    @super_cache[n - 1]
  end

  def super_top_down_helper(n, k)
    if n > k
      max = k
    else
      max = n - 1
    end
    return @super_cache[0] = [[1]] if n == 1
    pieces = []
    while max > 0
      jump = @super_cache[n - max - 1] || super_top_down_helper(n - max, k)
      piece = deep_dup(jump).map{ |set| set.push(max - 1) }
      if k >= n
        piece.push([n])
      end
      pieces.push(piece)
      max -= 1
    end
    idx = pieces.length - 1
    total = []
    while idx >= 0
      total += pieces[idx]
    end
    @super_cache[n - 1] = total
  end

  def knapsack(weights, values, capacity)
    return 0 if capacity == 0
    knapsack_table(weights, values, capacity)
    # print @knapsack_cache
    @knapsack_cache[weights.length][capacity]
  end

  # Helper method for bottom-up implementation
  def knapsack_table(weights, values, capacity)
    @knapsack_cache = Array.new(weights.length + 1) { Array.new(capacity + 1) { 0 } }
    idx = 1
    while idx <= weights.length
      idx2 = 0
      while idx2 <= capacity
        if weights[idx - 1] > idx2
          @knapsack_cache[idx][idx2] = @knapsack_cache[idx - 1][idx2]
        else
          val1 = @knapsack_cache[idx - 1][idx2]
          val2 = @knapsack_cache[idx - 1][idx2 - weights[idx - 1]] + values[idx - 1]
          max_value = val1 > val2 ? val1 : val2
          @knapsack_cache[idx][idx2] = max_value
        end
        idx2 += 1
      end
      idx += 1
    end
  end

  def maze_solver(maze, start_pos, end_pos)
  end
end
