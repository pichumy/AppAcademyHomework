# This class just dumbs down a regular Array to be statically sized.
class StaticArray
  attr_reader :store, :capacity
  def initialize(length)
    @store = []
    @capacity = length
  end

  # O(1)
  def [](index)
    # raise "index out of bounds" if index > @capacity - 1
    @store[index]
  end

  # O(1)
  def []=(index, value)
    # raise "index out of bounds" if index > @capacity
    @store[index] = value
  end

  def pop
    @store.pop
  end

  def shift
    @store.shift
  end

  def print_store
    print @store
  end

  def length
    @store.length
  end

  def max
    val = @store[0]
    @store.each do |el|
      if !el.nil? && el > val
        val = el
      end
    end
    val
  end

  protected
  attr_accessor :store
end
