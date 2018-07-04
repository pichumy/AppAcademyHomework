# require_relative "static_array"

class RingBuffer
  attr_reader :length

  def initialize
    @store = StaticArray.new(8)
    @length = 0
    @capacity = 8
    @starting_offset = 0
  end

  # O(1)
  def [](index)
    raise "index out of bounds" if index > @length - 1
    @store[(index + @starting_offset) % @capacity]
  end

  def max
    @store.max
  end

  def print_store
    @store.print_store
  end

  # O(1)
  def []=(index, val)
    @store[index] = val
  end

  # O(1)
  def pop
    raise "index out of bounds" if @length == 0
    return_value = @store[(@length - 1 + @starting_offset) % capacity]
    @store[(@length + @starting_offset) % capacity] = nil
    @length = @length - 1
    # print_store
    return_value
  end

  # O(1) ammortized
  def push(val)
    if @length == @capacity
      resize!
    end

    @store[(@length + @starting_offset) % @capacity] = val
    @length = @length + 1
    # print_store
  end

  # O(1)
  def shift
    raise "index out of bounds" if @length == 0
      # old start of array = nil
      return_value = @store[@starting_offset]
      @store[@starting_offset] = nil
      # shift pointer one downwards
      @starting_offset = @starting_offset + 1
      @length = @length - 1
      # print_store
      return_value
  end

  # O(1) ammortized
  def unshift(val)
    if @length == @capacity
      resize!
    end
    if @starting_offset > 0
      @starting_offset = @starting_offset - 1
      @store[@starting_offset] = val
      @length = @length + 1
    else
      @starting_offset = @capacity - 1
      @store[@starting_offset % @capacity] = val
      @length = @length + 1
    end
    # print_store
  end

  protected
  attr_accessor :capacity, :start_idx, :store
  attr_writer :length

  def check_index(index)
  end

  def resize!
    new_array = StaticArray.new(@length * 2)
    idx = @starting_offset + @capacity
    count = 0
    until count == @length
      new_array[idx % (@capacity * 2)] = @store[(idx - @capacity) % @capacity]
      idx += 1
      count += 1
    end
    @store = new_array
    @starting_offset = @starting_offset + @capacity
    @capacity = @capacity * 2
  end
end
