class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    return if game_over
    round_success_message
    @sequence_length += 1
  end

  def show_sequence
    add_random_color
    p @seq
    # shows sequence for 5 seconds
    #sleep(5)
    #system("clear")
  end

  def require_sequence
    @seq.each do |color|
      input = gets.chomp
      if input != color
        @game_over = true
        return
      end
    end
  end

  def add_random_color
    @seq.push(COLORS.sample)
  end

  def round_success_message
    puts("You have passed this round!")
  end

  def game_over_message
    puts("Game over! You lose!")
    puts("The correct sequence was #{@seq}")
  end

  def reset_game
    @sequence_length = 1
    @seq = []
    @game_over = false
  end
end

simon = Simon.new
simon.play
