# Represents the current state of the board
class Board
  SIDE_LENGTH = 3

  def initialize
    @grid = Array.new(SIDE_LENGTH) { |_| Array.new(SIDE_LENGTH) }
  end

  def to_s
    @grid.each.with_index.reduce("") do |output_string, (row, row_index)|
      output_string += if row_index.zero? then top_row_to_s
                       elsif row_index == SIDE_LENGTH - 1 then bottom_row_to_s
                       else middle_row_to_s(row)
                       end
      "#{output_string}\n"
    end
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
    win_conditions = [won_by_row?, won_by_column?, won_by_diagonal?]
    win_conditions.any?
  end

  private

  def bottom_row_to_s
    row = @grid[-1]
    row.to_s
  end

  def middle_row_to_s(row)
    row.to_s
  end

  def top_row_to_s
    row = @grid[0]
    row.to_s
  end

  def won_by_column?
    transposed_grid = @grid.transpose
    won_by_row?(transposed_grid)
  end

  def won_by_diagonal?
    first_diagonal = @grid.map.with_index { |row, row_index| row[row_index] }
    second_diagonal = @grid.map.with_index { |row, row_index| row[-(row_index + 1)] }

    won_by_element?(first_diagonal) || won_by_element?(second_diagonal)
  end

  def won_by_element?(element)
    # Takes in an array, representing an element (row, column or diagonal) and returns whether it is a win condition
    return false if element[0].nil?

    element.all?(element[0])
  end

  def won_by_row?(assessed_grid = @grid)
    assessed_grid.any? do |row|
      won_by_element?(row)
    end
  end
end
