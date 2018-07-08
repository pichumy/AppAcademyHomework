require_relative "heap"

class Array
  def heap_sort!
    # i = self.length - 1
    prc = Proc.new { |parent, child| child <=> parent }
    # while i > 0
    #   BinaryMinHeap.heapify_up(self, i, self.length, &prc)
    #
    #   i -= 1
    # end
    # p self
    # heapify
    self.each_with_index do |_, idx|
      self[0..idx] = BinaryMinHeap.heapify_up(self[0..idx], idx, self[0..idx].length, &prc)
    end
    # sort
    i = self.length - 1
    while i > 0
      self[0], self[i] = self[i], self[0]
      self[0...i].each_with_index do |_, _|
        self[0...i] = BinaryMinHeap.heapify_down(self[0...i], 0, self[0...i].length, &prc)
      end
      i -= 1
    end
    self
  end
end
