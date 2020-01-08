require "byebug"

class Simon
  COLORS = %w(red blue green yellow)

  # debugger

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until game_over
      take_turn
      system("clear")
    end

    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence

    if !game_over
      round_success_message
      sequence_length += 1
    else

    end
  end

  def show_sequence
    add_random_color
  end

  def require_sequence
    gets.chomp.split(' ')
  end

  def add_random_color
    seq << COLORS[rand(0..3)]
  end

  def round_success_message

  end

  def game_over_message

  end

  def reset_game
    sequence_length = 1
    game_over = false
    seq = []
  end
end
