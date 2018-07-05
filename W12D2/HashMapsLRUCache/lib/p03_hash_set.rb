require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    resize! if count == num_buckets
    bucket = self[key.hash]
    bucket.push(key)
    @count += 1
  end

  def include?(key)
    bucket = self[key.hash]
    bucket.include?(key)
  end

  def remove(key)
    bucket = self[key.hash]
    bucket.delete(key)
    @count -= 1
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
