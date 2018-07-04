require_relative "static_array"

class DynamicArray
  attr_reader :length, :capacity

  def initialize
    @array = StaticArray.new(8)
    @length = 0
    @capacity = 8
  end


  # O(1)
  def [](index)
    raise "index out of bounds" if index > @length - 1
    @array[index]
  end

  # O(1)
  def []=(index, value)
    @array[index] = value
  end

  # O(1)
  def pop
    raise "index out of bounds" if @length == 0
    @length = @length - 1
    @array.pop
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    if @length == @array.capacity
      new_array = StaticArray.new(@length * 2)
      @capacity = @length * 2
      idx = 0
      while idx < @length
        new_array[idx] = @array[idx]
        idx += 1
      end
      @array = new_array
    end
    @array[@length] = val
    @length = @length + 1

  end

  # O(n): has to shift over all the elements.
  def shift
    raise "index out of bounds" if @length == 0
    @length = @length - 1
    @array.shift
  end

  # O(n): has to shift over all the elements.
  def unshift(val)
    run = true
    if @length == @array.capacity
      new_array = StaticArray.new(@length * 2)
      @capacity = @length * 2
      idx = @length
      while idx > 0
        new_array[idx] = @array[idx - 1]
        idx = idx - 1
      end
      @array = new_array
      run = false
    end
    idx = @length
    while idx > 0 && run
      @array[idx] = @array[idx - 1]
      idx = idx - 1
    end
    @length = @length + 1
    @array[0] = val
  end

  def print_store
    @array.print_store
  end

  protected
  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index)
  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
  end
end
