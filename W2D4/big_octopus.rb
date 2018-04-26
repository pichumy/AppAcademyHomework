def sluggish_octopus(fishes)
  fishes.each_with_index do |fish, idx1|
    max_length_found = true
    fishes.each_with_index do |fish2, idx2|
      next if idx1 == idx2
      max_length_found = false if fish2.length > fish1.length
    end
    return fish if max_length_found
  end
end

def dominant_octopus(fishes)
  fishes.merge_sort.last
end

def clever_octopus(fishes)
  longest_length = 0
  longest_idx = nil
  fishes.each_with_idx do |fish, idx|
    if fish.length > longest_length
      longest_length = fish.length
      longest_idx = idx
    end
  end
  fishes[longest_idx]
end


def slow_dance(direction, tiles_array)
  index = nil
  tiles_array.each_with_index do |tile, idx|
    if tile == direction
      index = idx
    end
  end
  index
end

def constant_dance(direction, tiles_hash)
  tiles_hash[direction]
end


class Array
  def merge_sort(&prc)
    return self if size == 1
    middle = size / 2
    left = self[0...middle].merge_sort(&prc)
    right = self[middle...size].merge_sort(&prc)
    sort(left, right, &prc)
  end

  private
  def sort(left, right, &prc)
    prc = prc || Proc.new { |el, el2| el <=> el2 }
    results = []
    until left.empty? || right.empty?
      sorter = prc.call(left[0], right[0])
      case sorter
      when -1
        results.push(left.shift)
      when 0
        results.push(left.shift)
        results.push(right.shift)
      when 1
        results.push(right.shift)
      end
    end
    results + left + right
  end
end
