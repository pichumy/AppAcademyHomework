require_relative 'p02_hashing'
require_relative 'p04_linked_list'

class HashMap
  include Enumerable
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    bucket(key).include?(key)
  end

  def set(key, val)
    if count == num_buckets
     resize!
   end
   if self.include?(key)
    bucket(key).update(key, val)
   else
     bucket(key).append(key, val)
     @count += 1
   end
  end

  def get(key)
     bucket(key).get(key)
  end

  def delete(key)
    if self.include?(key)
      node = bucket(key).remove(key)
      @count -= 1
    end
    node
  end

  def each
    @store.each do |list|
      list.each do |node|
        yield(node.key, node.val)
      end
    end
    @store
  end

  def to_s
    pairs = inject([]) do |strs, (k, v)|
      strs << "#{k.to_s} => #{v.to_s}"
    end
    "{\n" + pairs.join(",\n") + "\n}"
  end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    num = num_buckets * 2
    old_store = @store.dup
    @store = Array.new(num) { LinkedList.new }
    @count = 0
    old_store.each do |bucket|
     bucket.each do |node|
       self.set(node.key, node.val)
     end
    end
  end

  def bucket(key)
    hashed_key = key.hash % num_buckets
    @store[hashed_key]
    # optional but useful; return the bucket corresponding to `key`
  end
end