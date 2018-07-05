require_relative 'p05_hash_map'

def can_string_be_palindrome?(string)
  map = HashMap.new
  string.chars.each do |char|
    if map.include?(char)
      map.set(char, map.get(char) + 1)
    else
      map.set(char, 1)
    end
  end
  odds = 0
  map.each do |k, v|
    odds += 1 if v.odd?
  end
  odds < 2
end
