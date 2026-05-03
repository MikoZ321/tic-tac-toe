# Represents the current state of the board
class Board
  SIDE_LENGTH = 3

  def initialize
    @grid = Array.new(SIDE_LENGTH) { |_| Array.new(SIDE_LENGTH) }
  end

  def to_s
    @grid.to_s
  end

  def place_marker(marker, target_index)
    row_index = target_index / SIDE_LENGTH
    column_index = target_index % SIDE_LENGTH
    @grid[row_index][column_index] = marker
  end

  def valid_move?(move)
    return false unless move.between?(1, SIDE_LENGTH**2) && @grid.flatten[move - 1].nil?

    true
  end

  def won?
    # TODO: add diagonal win conditions
    win_conditions = [won_by_row?, won_by_column?]
    win_conditions.any?
  end

  private

  def won_by_column?
    transposed_grid = @grid.transpose
    won_by_row?(transposed_grid)
  end

  def won_by_row?(assessed_grid = @grid)
    assessed_grid.any? do |row|
      !row[0].nil? && row.all?(row[0])
    end
  end
end
