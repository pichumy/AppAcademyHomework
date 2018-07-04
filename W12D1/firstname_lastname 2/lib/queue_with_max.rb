# Implement a queue with #enqueue and #dequeue, as well as a #max API,
# a method which returns the maximum element still in the queue. This
# is trivial to do by spending O(n) time upon dequeuing.
# Can you do it in O(1) amortized? Maybe use an auxiliary storage structure?

# Use your RingBuffer to achieve optimal shifts! Write any additional
# methods you need.

require_relative 'ring_buffer'

class MaxArray
  def initialize
    @store = []
  end

  def push(val)
    if @store.length == 0
      @store.push(val)
    end 
    kill = true
    if(val < @store.last)
      @store.push(val)
    elsif (val > @store[0])
      new_store = [val]
      @store = new_store
    else
      while kill
        if val > @store.last
          @store.pop
        else
          @store.push(val)
          kill = false
        end
      end
    end
  end

  def dequeue
    @store.shift
  end

  def max
    @store[0]
  end
end

class QueueWithMax
  attr_accessor :store

  def initialize
    @store = RingBuffer.new
    @max_array = MaxArray.new
  end

  def enqueue(val)
    @store.push(val)
    @max_array.push(val)
  end

  def dequeue
    val = @store.shift
    if max == val
      @max_array.dequeue
    end
    val
  end

  def max
    @max_array.max
  end

  def length
    @store.length
  end

end
