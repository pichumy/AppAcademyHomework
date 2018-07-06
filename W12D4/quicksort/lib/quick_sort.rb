class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
    return array if array.length <= 1
    pivot = array[0]
    left = []
    right = []
    idx = 1
    while idx < array.length
      if array[idx] > pivot
        right << array[idx]
      else
        left << array[idx]
      end
    end
    QuickSort.sort1(left) + [pivot] + QuickSort.sort1(right)
  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
     return array if length <= 1
     pivot = QuickSort.partition(array, start, length, &prc)
     QuickSort.sort2!(array, start, pivot - start, &prc)
     QuickSort.sort2!(array, pivot + 1, length - (pivot + 1), &prc)
  end

  def self.partition(array, start, length, &prc)
    # return array if length - start <= 1
    prc = prc || Proc.new { |el1, el2| el1 <=> el2 }
    pivot = array[start]
    partition = start + 1
    idx = start + 1
    while idx < start + length
      value = prc.call(array[idx], pivot)
      if idx > partition && value == -1
        array[partition], array[idx] = array[idx], array[partition]
        partition += 1
      elsif value == -1
        partition += 1
      end
      idx += 1
    end
    # swap pivot to center
    array[start], array[partition - 1] = array[partition - 1], array[start]
    partition - 1
  end
end
