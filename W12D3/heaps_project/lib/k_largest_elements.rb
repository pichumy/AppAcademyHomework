require_relative 'heap'

def k_largest_elements(array, k)
  prc = Proc.new { |parent, child| parent <=> child }
  # heapify
  array.each_with_index do |_, idx|
    array[0..idx] = BinaryMinHeap.heapify_up(array[0..idx], idx, array[0..idx].length, &prc)
  end
  #sort
  i = array.length - 1
  while i > 0
    array[0], array[i] = array[i], array[0]
    array[0...i].each_with_index do |_, idx|
      array[0...i] = BinaryMinHeap.heapify_down(array[0...i], 0, array[0...i].length, &prc)
    end
    i -= 1
  end
  # return up to K values
  array[0...k]
end
