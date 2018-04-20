class Stack
  def initialize
    @stack = []
  end

  def add(el)
    @stack.push(el)
    el
  end

  def remove
    @stack.pop
  end

  def show
    @stack.dup
  end
end

class Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue.push(el)
    el
  end

  def dequeue
    @queue.shift
  end

  def show
    @queue.dup
  end

end

class Map

  def initialize
    @map = []
  end

  def assign(key, value)
    key_array = self.keys
    if key_array.include?(key)
      @map[key_array.index(key)][1] = value
    else
      @map.push([key, value])
    end
    @map
  end

  def keys
    results = []
    @map.each do |pair|
      results.push(pair[0])
    end
    results
  end

  def values
    results = []
    @map.each do |pair|
      results.push(pair[1])
    end
    results
  end

  def lookup(key)
    return values[keys.index(key)] unless keys.index(key).nil?
    nil
  end

  def remove(key)
    unless keys.index(key).nil?
      removed = @map[keys.index(key)]
      @map.delete_at(keys.index(key))
      return removed
    end
    nil
  end

  def show
    deep_dup(@map)
  end

  def deep_dup(arr)
    arr.map{ |el| el.is_a?(Array) ? deep_dup(el) : el }
  end
end
