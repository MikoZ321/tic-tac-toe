# Represents the current state of the board
class Board
  def initialize
    @grid = Array.new(3) { |_| Array.new(3) }
  end

  def to_s
    @grid.to_s
  end

  def place_marker(marker, target_index)
    row_index = target_index / 3
    column_index = target_index % 3
    @grid[row_index][column_index] = marker
  end

  def valid_move?(move)
    return false unless move.between?(1, 9) && @grid.flatten[move - 1].nil?

    true
  end
end
