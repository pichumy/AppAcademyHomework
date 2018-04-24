require 'byebug'

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @player1 = name1
    @player2 = name2
    @cups = Array.new(14) {Array.new}
    place_stones
  end

  def place_stones
    @cups.each_with_index do |cup, idx|
      if idx == 6 || idx == 13
        next
      end
      cup.push(:stone)
      cup.push(:stone)
      cup.push(:stone)
      cup.push(:stone)
    end
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos < 1 || start_pos > 12
    false if @cups[start_pos].empty? || start_pos == 6 || start_pos == 13
    true
  end

  def make_move(start_pos, current_player_name)
    current_stone_array = []

    until @cups[start_pos].empty?
      current_stone_array.push(@cups[start_pos].pop)
    end
    cup_idx = start_pos
    until current_stone_array.empty?
      cup_idx += 1
      cup_idx = cup_idx % 14
      if cup_idx == 6
        @cups[6].push(current_stone_array.pop) if current_player_name == @player1
      elsif cup_idx == 13
        @cups[13].push(current_stone_array.pop) if current_player_name == @player2
      else
        @cups[cup_idx].push(current_stone_array.pop)
      end

    end
    # one turn has ended
    render
    next_turn(cup_idx)
  end

  def next_turn(ending_cup_idx)
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].count == 1
      :switch
    else
    ending_cup_idx
    end
    # helper method to determine what #make_move returns
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    return true if @cups[0...6].all? { |cup| cup.empty? }
    return true if @cups[6...14].all? { |cup| cup.empty? }
    false
  end

  def winner
    if @cups[6].length == @cups[13].length
      return :draw
    end
    if @cups[6].length > @cups[13].length
      return @player1
    else
      return @player2
    end
  end
end
