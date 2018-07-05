class MaxIntSet
  def initialize(max)
    @store = Array.new(max) { false }
    @max = max
  end

  def insert(num)
    raise "Out of bounds" if num >= @max || num < 0
    @store[num] = true
  end

  def remove(num)
    raise "Out of bounds" if num >= @max || num < 0
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    bucket = self[num]
    bucket.push(num)
  end

  def remove(num)
    bucket = self[num]
    bucket.delete(num)
  end

  def include?(num)
    bucket = self[num]
    bucket.include?(num)
  end

  private

  def [](num)
    @store[num % num_buckets]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    resize! if count == num_buckets
    bucket = self[num]
    bucket.push(num)
    @count += 1
  end

  def remove(num)
    bucket = self[num]
    bucket.delete(num)
    @count -= 1
  end

  def include?(num)
    bucket = self[num]
    bucket.include?(num)
  end

  private

  def [](num)
    @store[num % num_buckets]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    old_store = @store
    @count = 0
    @store = Array.new(num_buckets * 2){ Array.new }
    old_store.each do |bucket|
      bucket.each do |el|
        insert(el)
      end
    end
  end
end
