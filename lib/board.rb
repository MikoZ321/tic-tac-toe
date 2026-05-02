# Represents the current state of the board
class Board
  def initialize
    @grid = Array.new(3) { |_| Array.new(3) }
  end

  def to_s
    @grid.to_s
  end
end
