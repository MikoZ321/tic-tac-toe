# Manages the entire game process
class Game
  PLAYER_MARKERS = %w[X O].freeze

  def initialize
    @turn = 1
    @board = Board.new
  end

  def finished?
    puts "Player #{PLAYER_MARKERS[(@turn - 1) % 2]} has won." if @board.won?
    puts "The game ended in a tie." if @turn > 9

    @turn > 9 || @board.won?
  end

  def play_round
    # Print initial empty board without round number
    puts @board if @turn == 1
    prompt_input
    @board.place_marker(PLAYER_MARKERS[@turn % 2], @input - 1)
    puts self
    @turn += 1
  end

  def to_s
    "Round #{@turn}: \n#{@board}"
  end

  private

  def valid_input?(user_input)
    user_input_int = user_input.to_i
    # No need to check for type, as erroneous input converts to 0
    return true if @board.valid_move?(user_input_int)

    # Doesn't display the hint before the first invalid input
    puts "Field number must be between 1 and 9 and cannot already be occupied." unless user_input.nil?
    false
  end

  def prompt_input
    user_input = nil
    current_player_marker = PLAYER_MARKERS[@turn % 2]
    until valid_input?(user_input)
      puts "Player #{current_player_marker}, enter the number of the field, in which you wish to place a marker: "
      user_input = gets.chomp
    end
    @input = user_input.to_i
  end
end
