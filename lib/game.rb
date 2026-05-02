# Manages the entire game process
class Game
  PLAYER_MARKERS = %w[X O].freeze

  def initialize
    @turn = 1
    @board = Board.new
  end

  def play_round
    prompt_input
    puts self
    @turn += 1
  end

  def to_s
    puts "Round #{@turn}"
    @board.to_s
  end

  private

  def valid_input?(user_input)
    user_input_int = user_input.to_i
    return true if user_input_int.between?(1, 9)

    # Doesn't display the hint before the first invalid input
    puts "Field number must be between 1 and 9." unless user_input.nil?
    false
  end

  def prompt_input
    user_input = nil
    until valid_input?(user_input)
      puts "Enter the number of the field, in which you wish to place a marker: "
      user_input = gets.chomp
    end
    @input = user_input.to_i
  end
end
